@echo off

setlocal
pushd %~dp0

call start_setup.cmd
start %NEOVIM%\bin\nvim-qt-right.exe --maximized --no-ext-tabline

popd
endlocal
