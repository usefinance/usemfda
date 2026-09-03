#!/bin/bash
cd "$(dirname "$0")" || exit 1
ADDON_DIR="$PWD"
BASE_DIR="$ADDON_DIR"

if [ ! -f "$BASE_DIR/pyproject.toml" ]; then
    echo "[ERROR] Could not find the use-python folder."
    echo "Unzip the USEMFDA add-on files directly into the use-python folder, then run this installer again."
    exit 1
fi

if ! command -v uv >/dev/null 2>&1; then
    for LOCATION in /opt/homebrew/bin /usr/local/bin "$HOME/.local/bin"; do
        if [ -x "$LOCATION/uv" ]; then
            export PATH="$LOCATION:$PATH"
            break
        fi
    done
fi

if ! command -v uv >/dev/null 2>&1; then
    echo "uv was not found. Installing uv now ..."
    curl -LsSf https://astral.sh/uv/install.sh | sh || exit 1
    export PATH="$HOME/.local/bin:$PATH"
fi

echo "Preparing the shared use-python environment ..."
uv run --project "$BASE_DIR" python -c 'import sys; print(sys.executable)' || exit 1

echo "Installing USEMFDA AI and machine-learning packages ..."
uv pip install --python "$BASE_DIR/.venv/bin/python" --requirements "$ADDON_DIR/requirements-usemfda.txt" || exit 1

"$BASE_DIR/.venv/bin/python" -c 'import accelerate, datasets, ollama, openai, sentence_transformers, torch, transformers; print("USEMFDA add-on is ready.")' || exit 1

echo
echo "Installation complete. You can now open USEMFDA notebooks normally."
