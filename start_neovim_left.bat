@echo off

setlocal
pushd %~dp0

set NEOVIM_MY=%localappdata%\nvim

REM ==== VIM ====
set VIM=%NEOVIM%\share\nvim
set VIMRUNTIME=%NEOVIM%\share\nvim\runtime

REM ==== PATH ====
REM mingw64 because we need a working curl for :healthcheck
set PATH=%MSYS64%\mingw64\bin;%PATH%  
REM add NEOVIM\bin for windows clipboard support
set PATH=%PATH%;%NEOVIM%\bin
REM add Python\Scripts for autopep8
set PATH=%PATH%;%PY27_64_CONDA%\Scripts

REM ==== START ====
start %NEOVIM%\bin\nvim-qt-left.exe --maximized

popd
endlocal