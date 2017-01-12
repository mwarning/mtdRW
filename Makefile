
obj-m+=mtdRW.o

KERNEL_SOURCE=/lib/modules/$(shell uname -r)/build/ 

all:
	make -C ${KERNEL_SOURCE} M=$(PWD) modules

clean:
	make -C ${KERNEL_SOURCE} M=$(PWD) clean


# Alternatives for cross compiling
all-cross:
	make ARCH=arm CROSS_COMPILE=arm-cortexa8-linux-gnueabi- -C ${KERNEL_SOURCE} M=$(PWD) modules

clean-cross:
	make ARCH=arm CROSS_COMPILE=arm-cortexa8-linux-gnueabi- -C ${KERNEL_SOURCE} M=$(PWD) clean
