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

# Add frandom compatibility
backup_file ueventd.rc;
insert_line ueventd.rc "frandom" after "urandom" "/dev/frandom              0666   root       root\n";
insert_line ueventd.rc "erandom" after "urandom" "/dev/erandom              0666   root       root\n";
backup_file file_contexts;
insert_line file_contexts "frandom" after "urandom" "/dev/frandom		u:object_r:frandom_device:s0\n";
insert_line file_contexts "erandom" after "urandom" "/dev/erandom		u:object_r:erandom_device:s0\n";

# end ramdisk changes

write_boot;

## end install

