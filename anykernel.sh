# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# EDIFY properties
kernel.string= PixN Kernel by @haozeke
do.devicecheck=0
do.initd=0
do.modules=0
do.cleanup=1
device.name1=E6683
device.name2=sumire_dsds
device.name3=
device.name4=
device.name5=

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk


## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.flash.rc
insert_line init.kitakami.rc "init.pixn.rc" after "import init.kitakami.pwr.rc" "import init.pixn.rc";

# end ramdisk changes

write_boot;

## end install

