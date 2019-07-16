     _________           ________          _________     ________ ________
    |    _____|         |  ____  |        | _______|    |   __   |   __   |
    |   |       +      |  |____|  |       |______  |    |  |  |  |  |  |  |
    |   |    +        |  ________  |             | |    |  |  |  |  |  |  |
    |   |______      |  |        |  |      ______| |    |  |  |_____|  |  |
    |__________|    |__|          |__|    |________|    |__|           |__|

casmOS is a open source operating system based on multiple open source projects readily available on the net. This project has used code from the following projects:

- FreeDOS/FreeCOM
- POWER for APM Machines
- BEEP Driver

====================
  1. Prerequisites
====================

You will need a copy of Windows 98/Me to install. The Windows version has to natively support MS-DOS and cannot be based on the NT Project. The Netwide ASseMbler (NASM098.EXE) is an open source ASSembly compiler that is provided with this source code. openWATCOM C is a set of tools/ide that supports a variety of coding languages for DOS (i.e. C/C++/FORTRAN/MAKE/ASM/etc.). openWATCOM C has been added to LTOOLS because it is opensource.  Borland Turbo C++ is an IDE for DOS/Windows that can compile C/C++ code. Borland Turbo C/C++ is a fairly cheap compiler that can be found almost anywhere on the internet, however this IDE is not yet opensource. It uses the freeware license which will not be stored here. Arrow Assembly Compiler and Magic ASM Compiler are not stored in LTOOLS either because both tools are licensed as freeware as well. Microsoft Macro Assembler and Microsoft LINKER are stored in the same location as Arrow ASM and Magic ASM. All freeware applications can be found here: https://samyoeyt.wixsite.com/casmos/file-share. Below is a table that shows the programs required to compile each component:

-----------------------------------------------
	Component	|	Program
------------------------|----------------------
	 freecom	|    tc101, nasm098
	 kernel		|    tc201, nasm098
	  power		|	magicasm
	  beep		|	nasm098
          ansi          |    tc201, arrowasm

FreeCOM can be found in <master>/casmos-shell/command. FreeDOS Kernel can be found in <master>/casmos-shell/kernel. NASM098.EXE can be found in the same folder as readme.txt. TC101 is "Borland Turbo C/C++ 1.0(1)" and TC201 is "Borland Turbo C/C++ 2.0(1)".

=================================
  1.1. Installing Prerequisites
=================================

It is always recommended that you copy freecom and kernel to a folder on the root of your hard drive (i.e. C:\casmos-src). NASM098.EXE is added to path in the Windows directory, so you must copy the exe to "C:\WINDOWS". TC101 is added to path as TCPP; during install, choose "C:\TCPP" as the installation path for TC101. TC201 is added to path as TC201, choose "C:\TC201" as the installation path for TC201. If NASM098.EXE, TC101, or TC201 are not placed in said directories, the compilation process will not succeed. To install TC101/TC201, CD into the directory containing the setup files and type "INSTALL.EXE". This will launch the installer for the version you are installing. DO NOT CHOOSE TO UPGRADE TURBO C/C++ OR ELSE YOU WILL LOSE TC101!! The paths of the files should look like this:

freecom: <directory>
kernel: <directory>
power: <directory>
beep: <directory>
ansi: <directory>
tc101: C:\TCPP
tc201: C:\TC201
nasm098: C:\WINDOWS
ltools: C:\LTOOLS
asm112: C:\LTOOLS
arrowasm: C:\LTOOLS
masm+link: C:\LTOOLS

============================
  2. Compiling Source Code
============================

Each folder has two batch files that must be executed when compiling, CONFIG.BAT and BUILD.BAT. Never run these batch files without first launching COMMAND.COM (Command Prompt). If any errors occur during compilation, they will be logged during the compile phase. If you do recieve any errors during build process, you can run <batchname.bat> > <project-component.log> which will convert all output data in the Command window to a log file. CONFIG.BAT is the first batch file that should be executed. CONFIG.BAT will set environment variables for the compiler to use. Environment variables makes compilation scripts easier to make. BUILD.BAT is the main script that compiles the entire project. The output files for kernel will reside in <master>/casmos-shell/kernel/bin and all files should be copied to a separate folder for easier access. The output file for command will be <master>/casmos-shell/command/command.com and should be copied to the same folder as kernel files are/will reside.

==============================
  3. Creating a Floppy Image
==============================

You can create a floppy image of casmOS by executing the batch file INSTALL.BAT in <master>/casmos-shell/casmos. This will require that you have a blank (yes blank, this will require that you wiped your floppy) 1.44MiB High Density IBM Formatted 3½" Floppy Diskette. If you do not own a floppy diskette, you can mount the image "blank-image-144.img" (which can be found in the same folder as README.TXT) in a virtual machine and install it there.

===============================
  3.1. Using the Floppy Image
===============================

Once the floppy image is created, it can be used anywhere. It can also be uploaded to the internet for use by other people as well. There is a variety of options that can be used to run the floppy image that will be discussed in this section.

===================================
  3.1.1. Writing the Floppy Image
===================================

To write the floppy image to a real diskette, you will need a drive with a blank 1.44MiB (or blank 2.88MiB) diskette inserted into the drive. If you have a registered copy of WinImage, you can create a Self-Extracting Archive (SFX) of the Floppy and upload that to the internet, or with an unregistered version you can just write the image to diskette. If you are running Windows 2000 or later you can install miniwrite, a program that writes an image to floppy. If you would prefer 1-click batch script just execute WRITE.BAT.

================================================
  3.1.2. Emulating the Floppy Image using Qemu
================================================

We have provided a script in LTOOLS that uses Qemu to emulate the floppy image. Qemu will be set by default to x86 mode and use 32MiB of memory. Just execute EMULATE.BAT and Qemu will emulate casmOS. If you wish to edit any settings with the Qemu machine just edit the script.

====================================================
  3.1.3. Booting the Floppy Image from GRUB Legacy
====================================================

If you have a legacy version of GRUB and would like to boot from it, you will need to grab a copy of MEMDISK, which can be located here: https://github.com/sparrdrem/casmOS/blob/master/src/arch/x86_64/memdisk. You will then need to execute a series of commands. Boot from the GRUB device and press C. Execute the commands in the following order:

root (hd0,0)
kernel /path/to/memdisk
initrd /path/to/floppy.img
boot

!Note: casmOS Shell is a 16BIT application.

Alternatively if you wish to have these commands preset in GRUB, then you will need to create a new section in grub.cfg.

==============================================
  3.1.4. Booting the Floppy Image from GRUB2
==============================================

Same applies for GRUB Legacy images. You will need to grab a copy of MEMDISK, which can be located here: https://github.com/sparrdrem/casmOS/blob/master/src/arch/x86_64/memdisk. You will then need to execute a series of commands. Boot from the GRUB2 device and press C. Execute the commands in the following order:

linux16 /path/to/memdisk
initrd16 /path/to/floppy.img
boot

!Note: casmOS Shell is a 16BIT application.

Alternatively if you wish to have these commands preset in GRUB2, then you will need to create a new section in grub.cfg.

===========================================
  4. Modifying casmOS Shell Look and Feel
===========================================

The way casmOS looks depends on your AUTOEXEC.BAT file. The application that modifies casmOS Shell's look is ANSI, which is a driver that is loaded to system by default. Currently, ANSI is set to display the DOS cursor as 'A>' instead of the default A:\>. If you wish to go back to the default look, just run the command 'PROMPT $P$G'. PROMPT is a command that is registered into the Shell using the ANSI driver (based on NANSI). If you prefer the default look, you may either change 'PROMPT $N$G' in autoexec.bat to either 'PROMPT $P$G' or remove it altogether. You can also look at the following resources below to find out more about how to use the command 'PROMPT':

- https://kb.iu.edu/d/aamm
- https://ss64.com/nt/prompt.html

Please Note: You can only modify the floppy image outside of the ISO. ISO files are usually read-only archives so you will have to generate a new ISO.