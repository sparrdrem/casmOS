arch ?= x86_64
kernel := build/kernel-$(arch).bin
kernel64 := src/arch/$(arch)/kernel64.bin
kernelold := src/arch/$(arch)/kernelold.bin
iso := build/os-$(arch).iso
freedos_floppy := src/arch/$(arch)/filesystem.img
msdos_floppy := src/arch/$(arch)/casmosalpha.img
memdisk := src/arch/$(arch)/memdisk

linker_script := src/arch/$(arch)/linker.ld
grub_cfg := src/arch/$(arch)/grub.cfg
default_png := src/arch/$(arch)/default.png
assembly_source_files := $(wildcard src/arch/$(arch)/*.asm)
assembly_object_files := $(patsubst src/arch/$(arch)/%.asm, \
	build/arch/$(arch)/%.o, $(assembly_source_files))
c_source_files := $(wildcard src/arch/$(arch)/*.c)
c_object_files := src/arch/$(arch)/kc.o

.PHONY: all clean run iso

all: $(kernel)

clean:
	@rm -r build
	@rm -r bin

run: $(iso)
	@qemu-system-x86_64 -cdrom $(iso)

iso: $(iso)

$(iso): $(kernel) $(grub_cfg) $(freedos_floppy) $(msdos_floppy) $(memdisk) $(kernel64) $(kernelold)
	@mkdir -p build/isofiles/boot/grub
	@cp $(freedos_floppy) build/isofiles/boot
	@cp $(msdos_floppy) build/isofiles/boot
	@cp $(memdisk) build/isofiles/boot
	@cp $(kernel) build/isofiles/boot/kernel.bin
	@cp $(kernel64) build/isofiles/boot/kernel64.bin
	@cp $(grub_cfg) build/isofiles/boot/grub
	@cp $(default_png) build/isofiles/boot/grub
	@grub-mkrescue -o $(iso) build/isofiles 2> /dev/null
	@rm -r build/isofiles

$(kernel): $(assembly_object_files) $(linker_script) $(c_objective_files)
	@ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files) $(c_objective_files)

# compile assembly files
build/arch/$(arch)/%.o: src/arch/$(arch)/%.asm
	@mkdir -p $(shell dirname $@)
	@nasm -felf64 $< -o $@

build/arch/$(arch)/kc.o: src/arch/$(arch)/%.c
	@gcc -m32 -c $< -o $@
