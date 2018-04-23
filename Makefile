
PWD        := $(shell pwd)
KVERSION   := $(shell uname -r)
KERNEL_DIR  ?= /usr/src/linux-headers-$(KVERSION)/
MODULE_DIR  = /lib/modules/$(KVERSION)

MODULE_NAME  = mtdRW
obj-m       := $(MODULE_NAME).o

all:
	make -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean


# Alternatives for cross compiling
#all-cross:
#	make ARCH=arm CROSS_COMPILE=arm-cortexa8-linux-gnueabi- -C $(KERNEL_DIR) M=$(PWD) modules
#
#clean-cross:
#	make ARCH=arm CROSS_COMPILE=arm-cortexa8-linux-gnueabi- -C $(KERNEL_DIR) M=$(PWD) clean

install: $(MODULE_NAME).ko
	cp $(MODULE_NAME).ko $(MODULE_DIR)/kernel/drivers/mtd
	depmod

uninstall:
	rm -f $(MODULE_DIR)/kernel/drivers/mtd/$(MODULE_NAME).ko
	depmod
