@echo off
rem Script modified by SparrOSDeveloperTeam
rem Batch file version based on the ANSI makefile.
rem Useful if you have no MAKE tool. Otherwise, better use that.
rem Using the Arrowsoft Assembler here - Freeware and MASM compatible.
rem Using the Turbo C 2.x linker TLINK as LINK,
rem because VAL does not accept files without stack segment.
echo Replace ASM by MASM and VAL by LINK if you want.
echo If you have MAKE, use that, not this batch script.
call config.bat
echo.
echo ANSI: ansi.asm
%asm% ansi;
echo ANSI_P: ansi_p.asm
%asm% ansi_p;
echo ANSI_F: ansi_f.asm
%asm% ansi_f;
echo ANSI_I: ansi_i.asm
%asm% ansi_i;
echo ansi.sys:	ansi.obj ansi_p.obj ansi_f.obj ansi_i.obj
%tlink% /m ansi ansi_p ansi_f ansi_i;
%exe2bin% ansi ansi.sys
del ansi.exe
del *.obj
