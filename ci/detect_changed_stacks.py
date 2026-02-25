import json
import os
import subprocess
from re import match
from typing import Any, Callable, List, Set

# Define a type alias for better readability

OnOutput = Callable[[str], Any]


def get_changed_files():
    changed_files = set()
    source = "main"
    dest = "origin/main"
    if os.environ.get("GITHUB_EVENT_NAME") == "pull_request":
        source = "origin/" + os.environ["GITHUB_HEAD_REF"]
        dest = "origin/" + os.environ["GITHUB_BASE_REF"]

    command = [
        "git",
        "diff-tree",
        "-r",
        "--diff-filter=AMD",
        "--no-renames",
        "--name-only",
        source,
        dest,
    ]
    process = subprocess.run(command, check=True, stdout=subprocess.PIPE, text=True)
    for file in process.stdout.splitlines():
        changed_files.add(file)
    return changed_files


def get_changed_stacks(files):
    changed_stacks = set()
    processed_folder = set()

    for file_path in sorted(files):
        directory = os.path.dirname(file_path)

        if "projects" in file_path and directory not in processed_folder:
            changed_stacks.update(
                process_project_file(file_path, directory, processed_folder)
            )
        elif "modules" in file_path:
            changed_stacks.update(process_module_file(file_path))
    return changed_stacks


def process_project_file(
    file_path: str, directory: str, processed_folder: Set[str]
) -> Set[str]:
    changed_stacks: Set[str] = set()
    if ".rule" in file_path:
        changed_stacks.update(find_rule_stacks(file_path))
    elif any(ext in file_path for ext in [".tf"]):
        changed_stacks.add("./" + os.path.dirname(file_path))
    return changed_stacks


def find_rule_stacks(file_path: str) -> Set[str]:
    file_name = os.path.dirname(file_path)
    parts = file_name.split("/")
    environment = parts[-1]
    base_folder = "/".join(parts[:-2])
    return file_environment_stack_in_folder(base_folder, environment)


def file_environment_stack_in_folder(base_folder: str, environment: str) -> Set[str]:
    stacks = set()
    command = f'find {base_folder} -name "Pulumi.{environment}.yaml"'
    process = subprocess.run(command, shell=True, stdout=subprocess.PIPE)
    for stack in process.stdout.splitlines():
        stacks.add(stack.decode("utf-8").replace("./", ""))
    return stacks


def process_module_file(file_path: str) -> Set[str]:
    module = os.path.dirname(file_path)
    depended_folders = get_depended_folders(module)
    return depended_folders


def run_command(command: str) -> List[str]:
    process = subprocess.run(command, shell=True, stdout=subprocess.PIPE)
    return [line.decode("utf-8") for line in process.stdout.splitlines()]


def find_stacks(command: str) -> Set[str]:
    return {stack.replace("./", "") for stack in run_command(command)}


def get_depended_folders(module: str = None):
    depended_folders = set()
    command = f'grep -Ril "--exclude-dir=modules" "../../../{module}" "./projects"'
    process = subprocess.run(command, shell=True, stdout=subprocess.PIPE)
    for file in process.stdout.splitlines():
        depended_folders.add(os.path.dirname(file).decode("utf-8"))
    return depended_folders


def print_set(data_set: Set[str]) -> None:
    for item in data_set:
        print(item)


def main():
    print("Changed Files:")
    changed_files = get_changed_files()
    print_set(changed_files)

    print("Changed Stacks:")
    changed_stacks = get_changed_stacks(changed_files)
    print_set(changed_stacks)

    if changed_stacks is None:
        changed_stacks = []
    else:
        changed_stacks = list(changed_stacks)
    # Export changed_stacks to an environment variable for GitHub Actions
    changed_stacks_json = json.dumps(changed_stacks)

    # file deepcode ignore PT: <please specify a reason of ignoring this>
    with open(os.environ["GITHUB_ENV"], "a") as env_file:
        env_file.write(f"CHANGED_STACKS={changed_stacks_json}\n")


if __name__ == "__main__":
    main()
