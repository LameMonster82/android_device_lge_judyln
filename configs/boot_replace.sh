if [ "$TARGET_SLOT" = "0" ] ; then
  TARGET_SLOT_SUFFIX="_a"
elif [ "$TARGET_SLOT" = "1" ] ; then
  TARGET_SLOT_SUFFIX="_b"
else
  echo "Unknown target slot $TARGET_SLOT"
  exit 1
fi

dd if=/system/bin/boot.img of=/dev/block/bootdevice/by-name/boot"$TARGET_SLOT_SUFFIX" 

exit 0
