@echo off
:- THE CONFIG SCRIPT
:-
:- Uncomment any files if different ones are being used.

:- The Main location for all tools:
set LTOOLS=C:\LTOOLS
:- set BIN=%LTOOLS%\BIN
set TC2_BASE=C:\TC201

:- Now we set compilers:
set ASM=%LTOOLS%\asm.exe
:- set MASM=%LTOOLS%\MASM.EXE
set TLINK=%TC2_BASE%\TLINK.EXE
:- set LINK=%LTOOLS%\LINK.EXE
set EXE2BIN=%LTOOLS%\EXE2BIN.EXE

:- Now we're set to go!