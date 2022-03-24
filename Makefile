MY_MODULE_NAME := xpad
KO_FILE := $(MY_MODULE_NAME).ko

TARGET_IP   = 192.168.1.61
TARGET_USER = root

# To allow dynamic debug.
# Enables pr_debug().
CFLAGS_$(MY_MODULE_NAME).o := -DDEBUG

kbuild:
	@make ARCH=arm64 CROSS_COMPILE=$(TOOLCHAIN_PREFIX) -C $(KERNEL_PATH) M=`pwd` kernelversion
	@make ARCH=arm64 CROSS_COMPILE=$(TOOLCHAIN_PREFIX) -C $(KERNEL_PATH) M=`pwd`

clean:
	@make ARCH=arm64 CROSS_COMPILE=$(TOOLCHAIN_PREFIX) -C $(KERNEL_PATH) M=`pwd` clean

TARGET_PATH = /lib/modules/$(KERNEL_VERSION)/kernel/drivers/input/joystick

deploy:
	-@ssh $(TARGET_USER)@$(TARGET_IP) $(KERNEL_PATH) -p $(TARGET_PATH) 2>/dev/null
	scp $(KO_FILE) $(TARGET_USER)@$(TARGET_IP):$(TARGET_PATH)
	-@md5sum $(KO_FILE)
	-@ssh $(TARGET_USER)@$(TARGET_IP) md5sum $(TARGET_PATH)/$(KO_FILE)


