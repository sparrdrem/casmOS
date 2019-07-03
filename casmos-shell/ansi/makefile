# Makefile for nansi.sys
# $Log:	makefile $
# Revision 1.9  91/04/07  21:46:45  dan_kegel
# Added na_test.com test program for debugging with DEBUG.
# Edited by SparrOSDeveloperTeam
# 
# Revision 1.8  91/04/07  18:23:15  dan_kegel
# Now supports /t commandline switch to tell nansi about new text modes.
# 
# Revision 1.7  91/04/06  21:40:37  dan_kegel
# *** empty log message ***
# 
# Revision 1.6  91/04/06  21:24:49  dan_kegel
# *** empty log message ***
# 
# Revision 1.5  90/07/03  21:33:46  dank
# *** empty log message ***
# 
# Revision 1.4  90/07/03  20:42:35  unknown
# *** empty log message ***
# 
#
default: ansi.sys
	rem Done.

nansi.obj:	ansi.asm
	masm ansi;

ansi_p.obj:	ansi_p.asm
	masm ansi_p;

ansi_f.obj:	ansi_f.asm
	masm ansi_f;

ansi_i.obj:	ansi_i.asm
	masm ansi_i;

ansi.sys:	ansi.obj ansi_p.obj ansi_f.obj ansi_i.obj
	link /map ansi ansi_p ansi_f ansi_i;
	exe2bin ansi ansi.sys
	rm ansi.exe

na_test.obj:	na_test.asm
	masm na_test;

na_test.com:	na_test.obj ansi.obj ansi_p.obj ansi_f.obj ansi_i.obj
	link /map na_test nansi ansi_p ansi_f ansi_i;
	exe2bin na_test na_test.com
	rm na_test.exe
