from pathlib import Path

root = Path("data")
root.mkdir(exist_ok=True)
for i in range(40):
    lines = [f"INFO request={j} worker={i}" for j in range(2500)]
    lines[1234] = f"ERROR request=1234 worker={i}"
    (root / f"worker-{i:02d}.log").write_text("\n".join(lines) + "\n")
