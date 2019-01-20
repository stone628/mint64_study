all: bootloader disk.img

install: bootloader disk.img
	@echo "= installing built image..."
	sudo cp -f disk.img /media/sf_mintos
	@echo "= image installed"

bootloader:
	@echo "= building bootloader..."
	make -C 00.bootloader
	@echo "= built bootloader."

disk.img: 00.bootloader/bootloader.bin
	@echo "= building disk image..."
	cp 00.bootloader/bootloader.bin disk.img
	@echo "= built disk image."

clean:
	make -C 00.bootloader clean
	rm -f disk.img
