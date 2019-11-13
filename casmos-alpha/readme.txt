     _________           ________          _________     ________ ________
    |    _____|         |  ____  |        | _______|    |   __   |   __   |
    |   |       +      |  |____|  |       |______  |    |  |  |  |  |  |  |
    |   |    +        |  ________  |             | |    |  |  |  |  |  |  |
    |   |______      |  |        |  |      ______| |    |  |  |_____|  |  |
    |__________|    |__|          |__|    |________|    |__|           |__|

casmOS is an open source operating system based on multiple open source projects readily available on the net. This project has used code from the following projects:

- Microsoft DOS (OEM Builder) Version 2.11

====================
  1. Prerequisites
====================

You will need a copy of Windows 98/Me to install. The Windows version has to natively support MS-DOS and cannot be based on the NT Project. It's recommended that you build casmOS Alpha using Microsoft's official build tools. It's recommended that you download the build tools from the file share (included is a copy of an MS-DOS v2.11 Leading Edge 5¼" Floppy Diskette image to copy the files to and flash to an empty floppy image in the source code) here: https://samyoeyt.wixsite.com/casmos/file-share. Below is a table that shows the programs required to compile each component:

-------------------------
  Component  |  Program
-------------|-----------
   COMMAND   |    SDK
    MSDOS    |    SDK
     IO      |    SDK
   CHKDSK    |    SDK
    EDLIN    |    SDK
   DISKCOPY  |    SDK
   EXE2BIN   |    SDK
      FC     |    SDK
     FIND    |    SDK
    FORMAT   |    SDK
     INC     |    SDK
     MORE    |    SDK
    DEBUG    |    SDK
    PRINT    |    SDK
   RECOVER   |    SDK
     SORT    |    SDK
     SYS     |    SDK

Feel free to use other applications developed in casmos-shell (use casmos-shell's readme in that source folder)

=================================
  1.1. Installing Prerequisites
=================================

It is always recommended that you copy SYSTEM to the root of your hard drive as it retains all necessary files needed for compilation. Create an empty folder on C: and name it "TMP". Nothing needs to be done with the folder after creation. The paths of the folders should look like this:

CHKDSK: <directory>
COMMAND: <directory>
DEBUG: <directory>
DISKCOPY: <directory>
EDLIN: <directory>
EXE2BIN: <directory>
FC: <directory>
FIND: <directory>
FORMAT: <directory>
INC: <directory>
IO: <directory>
MORE: <directory>
MSDOS: <directory>
PRINT: <directory>
RECOVER: <directory>
SORT: <directory>
SYS: <directory>
MK.BAT: <directory> (make equivelant, see #2)
system: C:\system
config.bat: C:\ or C:\system (sets paths, see )
TOOLS: C:\TOOLS
TMP: C:\TMP

============================
  2. Compiling Source Code
============================

The file MK.BAT is used like make for Linux. First you need to run config.bat. Open Command Prompt and run the batch file. It will set all paths needed for building the code from source. Now just run mk <component> from C:\system and it will build the component. If you wish to build all components run "mk all". Built files are in EXE format however only FC, FIND, and EXE2BIN are the only ones supposed to be in EXE format. Everything else except MSDOS is built in COM format. MSDOS is built in SYS format.

==============================
  3. Creating a Floppy Image
==============================

Currently as of writing this document, casmOS Alpha v0.0.3's SYS.COM only runs on MS-DOS v2.xx and alikes. This means you will need to boot into DOS 2.xx mode to flash to a floppy. We recommend using our provided floppy image from the zip on the website. Copy the built files to the floppy and restart to boot into the floppy image. Run "FORMAT B:" to clear all data on the empty diskette and run SYS.COM to write the first 512 bytes to the floppy. Finally copy COMMAND.COM to the root of the floppy. Copy any additional files you built to wherever you see fit on the floppy. The floppy is now finished.

==============================
  3.1 Using the Floppy Image
==============================

Once the floppy image is created, it can be used anywhere. It can also be uploaded to the internet for use by other people as well. There is a variety of options that can be used to run the floppy image that will be discussed in this section.

==============================================
  3.1.1. Emulating the Floppy Image using VM
==============================================

This floppy image will mount in most virtual machine software, despite the floppy being a 360KiB diskette. The VM can span anywhere between 8MiB and 1GiB memory (possible to go beyond) and only requires keyboard.

====================================================
  3.1.2. Booting the Floppy Image from GRUB Legacy
====================================================

If you have a legacy version of GRUB and would like to boot from it, you will need to grab a copy of MEMDISK, which can be located here: https://github.com/sparrdrem/casmOS/blob/master/src/arch/x86_64/memdisk. You will then need to execute a series of commands. Boot from the GRUB device and press C. Execute the commands in the following order:

root (hd0,0)
kernel /path/to/memdisk
initrd /path/to/floppy.img
boot

!Note: casmOS Alpha is a 16BIT application.

Alternatively if you wish to have these commands present in GRUB, then you will need to create a new section in grub.cfg.

==============================================
  3.1.3. Booting the Floppy Image from GRUB2
==============================================

Same applies from GRUB Legacy images. You will need to grab a copy of MEMDISK, which can be located here: https://github.com/sparrdrem/casmOS/blob/master/src/arch/x86_64/memdisk. You will then need to execute a series of commands. Boot from the GRUB2 device and press C. Execute the commands in the following order:

kernel16 /path/to/memdisk
initrd16 /path/to/floppy.img
boot

!Note: casmOS Alpha is a 16BIT application.

Alternatively if you wish to have these commands present in GRUB2, then you will need to create a new section in grub.cfg.