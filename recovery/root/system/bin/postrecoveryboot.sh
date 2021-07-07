#!/sbin/sh

umount /vendor >/dev/null 2>&1
mount -w /vendor >/dev/null 2>&1
vendor_blk=`df -k|grep "/vendor"|awk '{print $1}'`
vendor_size=`df -k|grep $vendor_blk|awk '{print $2}'`
if ! `dd if=/dev/zero of=/vendor/test bs=1 count=1 >/dev/null 2>&1` ; then
  rm -f /vendor/test >/dev/null 2>&1
  umount /vendor >/dev/null 2>&1
  e2fsck -fp $vendor_blk >/dev/null 2>&1
  resize2fs $vendor_blk $(($vendor_size+10240))K >/dev/null 2>&1
  e2fsck -p -E unshare_blocks $vendor_blk >/dev/null 2>&1
  e2fsck -fp $vendor_blk >/dev/null 2>&1
else
  rm -f /vendor/test >/dev/null 2>&1
  umount /vendor >/dev/null 2>&1
fi
