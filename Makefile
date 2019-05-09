arch ?= x86_64
kernel := build/kernel-$(arch).bin
iso := build/os-$(arch).iso
msdos_com := src/arch/$(arch)/*.com
msdos_sys := src/arch/$(arch)/*.sys

linker_script := src/arch/$(arch)/linker.ld
grub_cfg := src/arch/$(arch)/grub.cfg
assembly_source_files := $(wildcard src/arch/$(arch)/*.asm)
assembly_object_files := $(patsubst src/arch/$(arch)/%.asm, \
	build/arch/$(arch)/%.o, $(assembly_source_files))

.PHONY: all clean run iso

all: $(kernel)

clean:
	@rm -r build

run: $(iso)
	@qemu-system-x86_64 -cdrom $(iso)

iso: $(iso)

$(iso): $(kernel) $(grub_cfg)
	@mkdir -p build/isofiles/boot/grub
	@cp $(kernel) build/isofiles/boot/kernel.bin
	@cp $(grub_cfg) build/isofiles/boot/grub
	@cp $(msdos_com) build/isofiles/boot
	@cp $(msdos_sys) build/isofiles/boot
	@grub-mkrescue -o $(iso) build/isofiles 2> /dev/null
	@rm -r build/isofiles

$(kernel): $(assembly_object_files) $(linker_script)
	@ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files)

# compile assembly files
build/arch/$(arch)/%.o: src/arch/$(arch)/%.asm
	@mkdir -p $(shell dirname $@)
	@nasm asm.asm -o asm.com
	@nasm -felf64 boot.asm
	@nasm command.asm -o command.com
	@nasm hex2bin.asm -o hex2bin.com
	@nasm io.asm -o io.sys
	@nasm msdos.asm -o msdos.sys
	@nasm -felf64 multiboot_header.asm
	@nasm stddos.asm -o comp.com
	@nasm trans.asm -o trans.com
