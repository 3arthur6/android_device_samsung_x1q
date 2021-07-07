#!/sbin/sh

echo " - Postrecoveryboot script : Logical partition sanitizer"
for i in 0 1 2 3 ; do
  mount -w /dev/block/dm-$i
  mount_pt=`df -k|grep "/dev/block/dm-$i"|awk '{print $6}'`
  blk_used=`df -k|grep $mount_pt|awk '{print $3}'`
  blk_full=`df -k|grep $mount_pt|awk '{print $2}'`
  umount $mount_pt
  if [ $(($blk_full-$blk_used)) -le 10240 ] ; then
    echo " - Postrecoveryboot script : Resizing $mount_pt partition (+10MB)"
    e2fsck -fp /dev/block/dm-$i
    resize2fs /dev/block/dm-$i $(($blk_full+10240))K
  fi
  echo " - Postrecoveryboot script : Forcing $mount_pt partition to be R/W"
  e2fsck -p -E unshare_blocks /dev/block/dm-$i
  e2fsck -fp /dev/block/dm-$i
done
echo " - Postrecoveryboot script : Done!"
