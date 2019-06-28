
KERNEL_DIR := /opt/work/repos/bitbucket-dev-lwn/linux-display5-fitImage
MODULE_NAME := mtdRW
PWD := $(shell pwd)
CROSS=/opt/target_sdk/tmp/sysroots/x86_64/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-

obj-m       := $(MODULE_NAME).o

all:
	make -C $(KERNEL_DIR) M=$(PWD) modules

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean


# Alternatives for cross compiling
all-cross:
	@echo 'Building Kernel Driver for module $(MODULE_NAME).'
	make ARCH=arm CROSS_COMPILE=$(CROSS) -C $(KERNEL_DIR) SUBDIRS=$(PWD) M=$(PWD) modules

clean-cross:
	make -C $(KERNEL_DIR) SUBDIRS=$(PWD)  ARCH=arm CROSS_COMPILE=$(CROSS) clean

install: $(MODULE_NAME).ko
	cp $(MODULE_NAME).ko $(MODULE_DIR)/kernel/drivers/mtd
	depmod

uninstall:
	rm -f $(MODULE_DIR)/kernel/drivers/mtd/$(MODULE_NAME).ko
	depmod
