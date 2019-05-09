arch ?= x86_64
kernel := build/kernel-$(arch).bin
iso := build/os-$(arch).iso
msdos_image := src/arch/$(arch)/filesystem.img
memdisk := src/arch/$(arch)/memdisk
msdos_source := src/console
msdos_bin := bin

linker_script := src/arch/$(arch)/linker.ld
grub_cfg := src/arch/$(arch)/grub.cfg
assembly_source_files := $(wildcard src/arch/$(arch)/*.asm)
assembly_object_files := $(patsubst src/arch/$(arch)/%.asm, \
	build/arch/$(arch)/%.o, $(assembly_source_files))

.PHONY: all clean run iso

all: $(kernel)

clean:
	@rm -r build
	@rm -r bin

run: $(iso)
	@qemu-system-x86_64 -cdrom $(iso)

iso: $(iso)

$(iso): $(kernel) $(grub_cfg) $(msdos_image) $(memdisk)
	@mkdir -p build/isofiles/boot/grub
	@cp $(msdos_image) build/isofiles/boot
	@cp $(memdisk) build/isofiles/boot
	@cp $(kernel) build/isofiles/boot/kernel.bin
	@cp $(grub_cfg) build/isofiles/boot/grub
	@grub-mkrescue -o $(iso) build/isofiles 2> /dev/null
	@rm -r build/isofiles

$(kernel): $(assembly_object_files) $(linker_script)
	@ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files)

# compile assembly files
build/arch/$(arch)/%.o: src/arch/$(arch)/%.asm
	@mkdir -p $(shell dirname $@)
	@nasm -felf64 $< -o $@

msdos: $(msdos_source) $(msdos_bin)
	@mkdir -p $(msdos_bin)
	@nasm $(msdos_source)/asm.asm -o $(msdos_bin)/asm.com
	@nasm $(msdos_source)/hex2bin.asm -o $(msdos_bin)/hex2bin.com
	@nasm $(msdos_source)/io.asm -o $(msdos_bin)/io.sys
	@nasm $(msdos_source)/msdos.asm -o $(msdos_bin)/msdos.sys
	@nasm $(msdos_source)/stddos.asm -o $(msdos_bin)/command.com
	@nasm $(msdos_source)/trans.asm -o $(msdos_bin)/trans.com
