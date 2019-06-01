     _________           ______            _________     ________ ________
    |    _____|         |  ____ |         | _______|    |   __   |   __   |
    |   |       +      |  |____|  |       |______  |    |  |  |  |  |  |  |
    |   |    +        |  ________  |             | |    |  |  |  |  |  |  |
    |   |______      |  |        |  |      ______| |    |  |  |_____|  |  |
    |__________|    |__|          |__|    |________|    |__|           |__|

casmOS is a open source operating system based on multiple open source projects readily available on the net. This project has used code from the following projects:

- FreeDOS/FreeCOM

====================
  1. Prerequisites
====================

You will need a copy of Windows 98/Me to install. The Windows version has to natively support MS-DOS and cannot be based on the NT Project. The Netwide ASseMbler (NASM098.EXE) is an open source ASSembly compiler that is provided with this source code. Borland Turbo C++ is an IDE for DOS/Windows that can compile C/C++ code. Borland Turbo C/C++ is a fairly cheap compiler that can be found almost anywhere on the internet, however this IDE is not yet opensource. It uses the freeware license which will not be stored here. Below is a table that shows the programs required to compile each component:

-----------------------------------------------
	Component	|	Program
------------------------|----------------------
	 freecom	|    tc101, nasm098
	 kernel		|    tc201, nasm098

FreeCOM can be found in <master>/casmos-shell/command. FreeDOS Kernel can be found in <master>/casmos-shell/kernel. NASM098.EXE can be found in the same folder as readme.txt. TC101 is "Borland Turbo C/C++ 1.0(1)" and TC201 is "Borland Turbo C/C++ 2.0(1)".

=================================
  1.1. Installing Prerequisites
=================================

It is always recommended that you copy freecom and kernel to a folder on the root of your hard drive (i.e. C:\casmos-src). NASM098.EXE is added to path in the Windows directory, so you must copy the exe to "C:\WINDOWS". TC101 is added to path as TCPP; during install, choose "C:\TCPP" as the installation path for TC101. TC201 is added to path as TC201, choose "C:\TC201" as the installation path for TC201. If NASM098.EXE, TC101, or TC201 are not placed in said directories, the compilation process will not succeed. To install TC101/TC201, CD into the directory containing the setup files and type "INSTALL.EXE". This will launch the installer for the version you are installing. DO NOT CHOOSE TO UPGRADE TURBO C/C++ OR ELSE YOU WILL LOSE TC101!! The paths of the files should look like this:

freecom: <directory>
kernel: <directory>
tc101: C:\TCPP
tc201: C:\TC201
nasm098: C:\WINDOWS

============================
  2. Compiling Source Code
============================

Each folder has two batch files that must be executed when compiling, CONFIG.BAT and BUILD.BAT. Never run these batch files without first launching COMMAND.COM (Command Prompt). If any errors occur during compilation, they will be logged during the compile phase. If you do recieve any errors during build process, you can run <batchname.bat> > <project-component.log> which will convert all output data in the Command window to a log file. CONFIG.BAT is the first batch file that should be executed. CONFIG.BAT will set environment variables for the compiler to use. Environment variables makes compilation scripts easier to make. BUILD.BAT is the main script that compiles the entire project. The output files for kernel will reside in <master>/casmos-shell/kernel/bin and all files should be copied to a separate folder for easier access. The output file for command will be <master>/casmos-shell/command/command.com and should be copied to the same folder as kernel files are/will reside.

==============================
  3. Creating a Floppy Image
==============================

You can create a floppy image of casmOS by executing the batch file INSTALL.BAT in <master>/casmos-shell/casmos. This will require that you have a blank (yes blank, this will require that you wiped your floppy) 1.44MiB High Density IBM Formatted 3½" Floppy Diskette. If you do not own a floppy diskette, you can mount the image "blank-image-144.img" (which can be found in the same folder as README.TXT) in a virtual machine and install it there.