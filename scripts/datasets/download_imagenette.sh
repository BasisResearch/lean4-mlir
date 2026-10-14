#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")/../.."   # the repo root: data/ lives there
REPO_ROOT=$(pwd)
mkdir -p data/imagenette
cd data/imagenette
if [ ! -f "train.bin" ]; then
  # The preprocessing needs Pillow + numpy; settle that before the 330 MB download, not after it.
  # Use $PYTHON if set, else the repo's .venv (the one the README's setup makes), as
  # download_arasl.sh / download_plant.sh do. A stock Ubuntu python3 has no pip and refuses a
  # system-wide install (PEP 668), so "pip install Pillow numpy" was a dead end there: instead,
  # put the two packages into the repo .venv, creating it if the setup has not yet.
  PY=${PYTHON:-$REPO_ROOT/.venv/bin/python3}
  if ! "$PY" -c 'import PIL, numpy' 2>/dev/null; then
    if [ -z "${PYTHON:-}" ]; then
      if [ ! -x "$PY" ]; then
        echo "Creating the repo .venv for the preprocessing (Pillow + numpy)..."
        python3 -m venv "$REPO_ROOT/.venv" || {
          echo "ERROR: python3 -m venv failed. On Debian/Ubuntu: sudo apt install python3-venv, then re-run." >&2
          exit 1; }
      fi
      echo "Installing Pillow + numpy into .venv..."
      "$PY" -m pip install --quiet Pillow numpy
    fi
    if ! "$PY" -c 'import PIL, numpy' 2>/dev/null; then
      echo "ERROR: $PY lacks Pillow and/or numpy, which the preprocessing needs." >&2
      echo "       $PY -m pip install Pillow numpy, then re-run." >&2
      exit 1
    fi
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
  "$PY" ../../scripts/datasets/preprocess_imagenette.py imagenette2-320 .
  rm -rf imagenette2-320 imagenette2-320.tgz
fi
echo "Done. Files in ./data/imagenette/"
ls -lh *.bin
