@echo off
rem batch file to build executable
rem IF NOTHING COMPILES, CHECK TO SEE THAT NASM IS IN THE PROPER PLACE

call config.bat
if not exist %MASM% goto nonasm

mkdir bin
%MASM% SHUTDOWN.ASM -o BIN\SHUTDOWN.COM
echo SHUTDOWN.COM is built in BIN\
exit

:nonasm
echo NASM not found, cannot compile.
exit