@echo off

setlocal
pushd %~dp0

call start_setup.cmd
%NEOVIM%\bin\nvim.exe

popd
endlocal
