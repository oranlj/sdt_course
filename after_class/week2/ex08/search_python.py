from pathlib import Path

needle = "ERROR"
for path in Path("data").glob("*.log"):
    for number, line in enumerate(path.read_text().splitlines(), 1):
        if needle in line:
            print(f"{path}:{number}:{line}")
