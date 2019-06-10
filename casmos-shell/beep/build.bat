@echo off
rem batch file to build executable
rem IF NOTHING COMPILES, CHECK TO SEE THAT NASM IS IN THE PROPER PLACE

call config.bat
if not exist %XNASM% goto nonasm

mkdir bin
%XNASM% BEEP.ASM -o BIN\BEEP.COM
echo BEEP.COM is built in BIN\
exit

:nonasm
echo NASM not found, cannot compile.
exit
