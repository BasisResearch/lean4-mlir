#!/bin/bash
set -e
cd "$(dirname "${BASH_SOURCE[0]}")/../.."   # the repo root: data/ lives there

mkdir -p data/mnist

# MNIST used to sit loose in data/; every loader now reads data/mnist/, like data/cifar-10/ and
# data/imagenette/. Move an old checkout's files across instead of downloading them again.
for f in data/{train,t10k}-{images-idx3,labels-idx1}-ubyte; do
  [ -f "$f" ] && mv -n "$f" data/mnist/ && echo "moved $f -> data/mnist/"
done

cd data/mnist

BASE="https://storage.googleapis.com/cvdf-datasets/mnist"

for FILE in train-images-idx3-ubyte.gz \
            train-labels-idx1-ubyte.gz \
            t10k-images-idx3-ubyte.gz  \
            t10k-labels-idx1-ubyte.gz; do
  if [ ! -f "${FILE%.gz}" ]; then
    echo "Downloading $FILE ..."
    curl -fO "$BASE/$FILE"
    gunzip -f "$FILE"
  else
    echo "${FILE%.gz} already exists, skipping."
  fi
done

echo "Done. Files in ./data/mnist/"
ls -lh
