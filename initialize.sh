#!/usr/bin/env bash
# Initialize SAMTiral: create the Python env and download the SAM checkpoint.
set -euo pipefail
cd "$(dirname "$0")"

echo "==> Syncing Python environment (uv)"
uv sync

echo "==> Downloading SAM checkpoint"
mkdir -p segment-anything
dest="segment-anything/sam_vit_b_01ec64.pth"
if [ -f "$dest" ]; then
  echo "  [skip] $dest already exists"
else
  echo "  [get ] $dest"
  curl -L --fail -o "$dest" \
    https://dl.fbaipublicfiles.com/segment_anything/sam_vit_b_01ec64.pth
fi

echo "==> Done."
