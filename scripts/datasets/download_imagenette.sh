#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")/../.."   # the repo root: data/ lives there
mkdir -p data/imagenette
cd data/imagenette
if [ ! -f "train.bin" ]; then
  # the preprocessing step needs both; check before the 330 MB download, not after it
  if ! python3 -c 'import PIL, numpy' 2>/dev/null; then
    echo "ERROR: $(command -v python3 || echo python3) lacks Pillow and/or numpy, which the preprocessing needs." >&2
    echo "       pip install Pillow numpy   (or activate a venv that has them), then re-run." >&2
    exit 1
  fi
  if [ -f imagenette2-320.tgz ]; then
    echo "imagenette2-320.tgz already here (a previous run stopped after the download); skipping the download"
  else
    echo "Downloading imagenette2-320..."
    # into a .part first, so an interrupted download is never mistaken for a finished one
    curl -L -o imagenette2-320.tgz.part https://s3.amazonaws.com/fast-ai-imageclas/imagenette2-320.tgz
    mv imagenette2-320.tgz.part imagenette2-320.tgz
  fi
  echo "Extracting..."
  # --no-same-owner: as root (cloud pods) tar restores the archive's uid/gid,
  # which network-volume mounts refuse ("Cannot change ownership to uid 501")
  tar xzf imagenette2-320.tgz --no-same-owner
  echo "Preprocessing to binary format..."
  python3 ../../scripts/datasets/preprocess_imagenette.py imagenette2-320 .
  rm -rf imagenette2-320 imagenette2-320.tgz
fi
echo "Done. Files in ./data/imagenette/"
ls -lh *.bin
