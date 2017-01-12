/**
 * @file    mtdRW.c
 * @author  Moritz Warning
 * @date    11 January 2017
 * @version 1.0
 * @brief  A Linux Module to make mtd devices writeable until the syste reboots.
 * This is useful when a partition needs to be written, but is initially read only.
*/

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/mtd/mtd.h>
#include <linux/err.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Moritz Warning");
MODULE_DESCRIPTION("A simple Linux driver to make mtd devices writeable.");
MODULE_VERSION("1.0");

static int __init mtdRW_init(void) {
    struct mtd_info *mtd;
    bool keep_going;
    int n;

    printk(KERN_INFO "mtdRW: Start to unlock MTD partitions!\n");

    keep_going = true;
    for (n = 0; keep_going; n++) {
        mtd = get_mtd_device(NULL, n);
	if (!IS_ERR(mtd)) {
            mtd->flags |= MTD_WRITEABLE;
            printk(KERN_INFO "mtdRW: Make mtd device writeable: %s\n", mtd->name);
            put_mtd_device(mtd);
        } else {
            keep_going = false;
        }
    }

   return 0;
}

static void __exit mtdRW_exit(void) {
    // Nothing to do
}

module_init(mtdRW_init);
module_exit(mtdRW_exit);
