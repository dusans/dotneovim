@echo off

setlocal
pushd %~dp0

call start_setup.cmd
start %NEOVIM%\bin\nvim-qt-left.exe --maximized --no-ext-tabline

popd
endlocal
