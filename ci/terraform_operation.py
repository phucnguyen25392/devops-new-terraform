import logging
import sys
import subprocess

def _run_cmd(cmd: list[str], cwd: str):
    result = subprocess.run(
        cmd,
        cwd=cwd,
        text=True,
        capture_output=True
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"Command failed: {' '.join(cmd)}\n{result.stderr}"
        )

    return result.stdout

def _process_output(workdir: str, output: str):
    try:
        result = subprocess.run(
            ["terraform", "show", "-no-color", output],
            cwd=workdir,
            capture_output=True,
            text=True,
            check=True
        )

        with open(f"{workdir}/{output}.txt", "w") as f:
            f.write(result.stdout)

        print(result.stdout)
    except Exception as e:
        logging.error(f"Error: {e}")
        sys.exit(1)


def terraform_operation(workdir: str, operation: str) -> None:
    if operation == "plan":
        try:
            _run_cmd(
                ["terraform", "init"],
                workdir
            )
            _run_cmd(
                ["terraform", "plan", "-input=false", "-out=tfplan"],
                workdir
            )
            _process_output(workdir, "tfplan")
            return
        except Exception as e:
            logging.error(f"Error: {e}")
            sys.exit(1)
    if operation == "apply":
        try:
            return _run_cmd(
                ["terraform", "apply", "-input=false", "-auto-approve"],
                workdir
            )
        except Exception as e:
            logging.error(f"Error: {e}")
            sys.exit(1)
    raise ValueError(f"Invalid operation: {operation}. Must be 'apply' or 'plan'.")
    
def main():
    logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
    if len(sys.argv) != 3:  # noqa: E501
        logging.error(
            "Usage: python terraform_operations.py <path_to_stack_file> <operation (up/preview)>"
        )
        sys.exit(1)

    workdir = sys.argv[1]
    operation = sys.argv[2]
    logging.info(f"Processing stack: {workdir} for operation: {operation}")
    terraform_operation(workdir, operation)


if __name__ == "__main__":
    main()