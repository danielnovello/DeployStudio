# Mount Volume

echo "Mounting Volume"

mount -uw /

# Disable SIP

echo "Disabling the SIP..."

/usr/bin/csrutil disable

echo "Disabling the USB Drivers..."

if [ -d /System/Library/Extensions/usbkextbackup/ ]; then
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/IOUSBMassStorageClass.kext /Volumes/Macintosh\ HD/System/Library/Extensions/
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/IOUSBMassStorageDriver.kext /Volumes/Macintosh\ HD/System/Library/Extensions/
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup
else
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/IOUSBMassStorageClass.kext /Volumes/Macintosh\ HD/System/Library/Extensions/
	/bin/cp -pvR /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup/IOUSBMassStorageDriver.kext /Volumes/Macintosh\ HD/System/Library/Extensions/
	/bin/rm -rf /Volumes/Macintosh\ HD/System/Library/Extensions/usbkextbackup
fi

touch /System/Library/Extensions

# Enable SIP Again

echo "Enabling the SIP..."

/usr/bin/csrutil enable


echo "Done"