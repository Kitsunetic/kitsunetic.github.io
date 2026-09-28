#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd -- "$script_dir/.." && pwd)"
cv_filename="CV_$(TZ=Asia/Seoul date +%y%m%d).pdf"
cd "$script_dir"

if ! command -v tectonic >/dev/null 2>&1; then
  printf 'Error: tectonic is required to compile main.tex.\n' >&2
  exit 127
fi
if ! command -v python3 >/dev/null 2>&1; then
  printf 'Error: python3 is required to update index.html.\n' >&2
  exit 127
fi

mkdir -p build
tectonic --outdir build main.tex
cp build/main.pdf "$repo_root/assets/$cv_filename"
python3 - "$repo_root/index.html" "$cv_filename" <<'PY'
import re
import sys
from pathlib import Path

index_path = Path(sys.argv[1])
cv_filename = sys.argv[2]
html = index_path.read_text()
updated_html, count = re.subn(
    r'href="assets/CV(?:_\d{6})?\.pdf"',
    f'href="assets/{cv_filename}"',
    html,
)
if count == 0:
    raise SystemExit(f"No CV PDF link found in {index_path}")
index_path.write_text(updated_html)
PY
printf 'Created %s/build/main.pdf and updated %s/assets/%s and index.html\n' "$script_dir" "$repo_root" "$cv_filename"
