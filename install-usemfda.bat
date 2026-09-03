@echo off
setlocal

set "ADDON_DIR=%~dp0"
set "BASE_DIR=%ADDON_DIR%"

if not exist "%BASE_DIR%pyproject.toml" (
    echo [ERROR] Could not find the use-python folder.
    echo Unzip the USEMFDA add-on files directly into the use-python folder, then run this installer again.
    pause
    exit /b 1
)

where uv >nul 2>nul
if errorlevel 1 if exist "%USERPROFILE%\.local\bin\uv.exe" set "PATH=%USERPROFILE%\.local\bin;%PATH%"

where uv >nul 2>nul
if errorlevel 1 (
    echo uv was not found. Installing uv now ...
    powershell -NoProfile -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"
    if errorlevel 1 goto :error
    set "PATH=%USERPROFILE%\.local\bin;%PATH%"
)

echo Preparing the shared use-python environment ...
uv run --project "%BASE_DIR%" python -c "import sys; print(sys.executable)"
if errorlevel 1 goto :error

echo Installing USEMFDA AI and machine-learning packages ...
uv pip install --python "%BASE_DIR%.venv\Scripts\python.exe" --requirements "%ADDON_DIR%requirements-usemfda.txt"
if errorlevel 1 goto :error

"%BASE_DIR%.venv\Scripts\python.exe" -c "import accelerate, datasets, ollama, openai, sentence_transformers, torch, transformers; print('USEMFDA add-on is ready.')"
if errorlevel 1 goto :error

echo.
echo Installation complete. You can now open USEMFDA notebooks normally.
pause
exit /b 0

:error
echo.
echo [ERROR] The USEMFDA add-on could not be installed.
echo Please take a screenshot of this window and send it to the instructor.
pause
exit /b 1
