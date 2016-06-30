# Mount Volume

echo "Mounting Volume"

mount -uw /

# Disable SIP

echo "Disabling the SIP..."

/usr/bin/csrutil disable

echo "Disabling the USB Drivers..."

if [ -d /System/Library/Extensions/usbkextbackup/ ]; then
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageClass.kext /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageDriver.kext /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageClass.kext
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageDriver.kext
else
	/bin/mkdir -p /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageClass.kext /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageDriver.kext /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageClass.kext
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/IOUSBMassStorageDriver.kext
fi

touch /System/Library/Extensions

# Enable SIP Again

echo "Enabling the SIP..."

/usr/bin/csrutil enable


echo "Done"