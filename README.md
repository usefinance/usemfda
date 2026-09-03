# USEMFDA AI and machine-learning add-on

This add-on installs the AI, large-language-model, transformer, and NLP packages used in USEMFDA into an existing `use-python` environment. It does not replace or modify the shared `use-python` package configuration.

## Install

1. Download and unzip this repository next to your `use-python` folder.
2. Double-click `install-usemfda.bat` on Windows or `install-usemfda.command` on macOS.
3. Keep the window open until the installation finishes.

Your folders should look like this:

```text
parent-folder/
├── use-python/
└── usemfda/
```

The installer prepares `use-python/.venv` if needed and adds the course packages to that same environment. Afterwards, open notebooks normally through JupyterLab or Visual Studio Code.

The first installation downloads PyTorch and related packages, so it can take several minutes.

## Included packages

- `openai`
- `ollama`
- `torch`
- `transformers`
- `datasets`
- `sentence-transformers`
- `accelerate`

`ollama` is a Python client only. Using local models also requires the separate Ollama application and a downloaded model.
