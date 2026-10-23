@echo off
cd /d "%~dp0"
if not exist ".venv\Scripts\python.exe" (
  echo Creating .venv...
  py -3.11 -m venv .venv
  if errorlevel 1 (
    echo Python 3.11 was not found. Install it from python.org and run this file again.
    pause
    exit /b 1
  )
  ".venv\Scripts\python.exe" -m pip install -U pip
  ".venv\Scripts\python.exe" -m pip install -e ".[runtime]"
  if errorlevel 1 (
    echo Dependency install failed.
    pause
    exit /b 1
  )
)
".venv\Scripts\lingua-relay.exe" app
if errorlevel 1 pause
