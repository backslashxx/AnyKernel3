### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=WestCoast/xx+ Kernel
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=mojito
device.name2=sunny
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
LOS_SYSTEM_ROOT_WORKAROUND=1
'; } # end properties

# NOTE: LOS_SYSTEM_ROOT_WORKAROUND to workaround for los recovery


### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes


# boot shell variables
BLOCK=/dev/block/bootdevice/by-name/boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;


## boot install
dump_boot;

# begin ramdisk changes

# end ramdisk changes

write_boot;
## end boot install


## vendor_boot files attributes
# vendor_boot_attributes() {
# set_perm_recursive 0 0 755 644 $RAMDISK/*;
# set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
# } # end attributes


# vendor_boot shell variables
BLOCK=vendor_boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto;

# reset for vendor_boot patching
reset_ak;


## vendor_boot install
split_boot; # skip unpack/repack ramdisk since we don't need vendor_ramdisk access

flash_boot;
## end vendor_boot install
