@echo off

set NEOVIM_MY=%localappdata%\nvim

REM ==== VIM ====
set VIM=%NEOVIM%\share\nvim
set VIMRUNTIME=%NEOVIM%\share\nvim\runtime

REM ==== PATH ====
REM add mingw64: because we need a working curl for :healthcheck
set PATH=%PATH%;%MSYS64%\mingw64\bin
REM add NEOVIM\bin: for windows clipboard support
set PATH=%PATH%;%NEOVIM%\bin
REM add Python\Scripts: for autopep8
set PATH=%PATH%;%PY27_64_CONDA%\Scripts
REM add NEOVIM_MY for: flake8_py27.bat
set PATH=%PATH%;%NEOVIM_MY%
