#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing dependencies..."
uv sync

echo "==> Running data-cleaning notebook..."
uv run jupyter nbconvert --to notebook --execute src/data_cleaning.ipynb --output data_cleaning.executed.ipynb

echo "==> Running visualization notebook..."
uv run jupyter nbconvert --to notebook --execute src/Phase_2.ipynb --output Phase_2.executed.ipynb

echo "==> Pipeline complete."
echo "Check outputs in:"
echo "  - data/preprocessed/"
echo "  - paper/figs/"
