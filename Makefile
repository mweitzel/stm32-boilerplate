rand = $(shell head /dev/urandom |md5|cut -c -6)

build:
	cargo build --release

up: build
	cargo objcopy --release -- -O binary ./bintarget/app.bin
	cp ./bintarget/app.bin ./bintarget/$(rand).app.bin
	/Users/matthew/Documents/Arduino/hardware/Arduino_STM32/tools/macosx/serial_upload cu.usbserial-A50285BI {upload.altID} {upload.usbID} ./bintarget/app.bin

