# mtdRW

A small Linux kernel module that makes all MTD partitions writeable.

Build and Load:
```
make
insmod mtdRW.ko
```

dmesg output
```
[86522.151371] mtdRW: Start to unlock MTD partitions!
[86522.151403] mtdRW: Make mtd device writeable: SPL (spi)
[86522.151417] mtdRW: Make mtd device writeable: u-boot (spi)
[86522.151426] mtdRW: Make mtd device writeable: uboot-env (spi)
[86522.151433] mtdRW: Make mtd device writeable: uboot-envr (spi)
[86522.151450] mtdRW: Make mtd device writeable: swupdate-fitImg (spi)
[86522.151471] mtdRW: Make mtd device writeable: swupdate-initramfs (spi)
[86522.151492] mtdRW: Make mtd device writeable: reserved (spi)
[86522.151503] mtdRW: Make mtd device writeable: factory (spi)
```

Sources:

* http://electronics.stackexchange.com/questions/67955/arm-linux-and-uboot-can-i-make-a-read-only-mtd-writable
