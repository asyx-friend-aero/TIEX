x86-asm-srcfiles := $(shell find . -maxdepth 1 -name "*.asm")
x86-asm-objfiles := $(patsubst ./%.asm, build/%.o, $(x86-asm-srcfiles))

.PHONY: build-x86
build-x86: $(x86-asm-objfiles)
	mkdir -p img/boot
	ld.lld -m elf_i386 -n -o img/boot/tiex.bin -T linker.ld $(x86-asm-objfiles)
	grub-mkrescue -o tiex.iso img

build/%.o: %.asm
	mkdir -p $(dir $@)
	nasm -f elf32 $< -o $@

.PHONY: clean
clean:
	rm -rf build img/boot/tiex.bin tiex.iso

