# USEMFDA AI and machine-learning add-on

This add-on installs the AI, large-language-model, transformer, and NLP packages used in USEMFDA into an existing [`use-python`](https://github.com/usefinance/use-python) environment. It does not replace or modify the shared `use-python` package configuration.

## Install

1. Download the latest add-on archive.
2. Unzip all its files directly into your existing `use-python` folder.
3. Double-click `install-usemfda.bat` on Windows or `install-usemfda.command` on macOS.
4. Keep the window open until the installation finishes.

Your folders should look like this:

```text
use-python/
├── pyproject.toml
├── install-usemfda.bat
├── install-usemfda.command
└── requirements-usemfda.txt
```

The installer prepares `.venv` if needed and adds the course packages to that same environment. Afterwards, open notebooks normally through JupyterLab or Visual Studio Code.

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
