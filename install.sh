#!/system/bin/sh

mount -o remount,rw /system

echo "Unpacking secure_root to /bin/"
cp -avr secure_root /system/bin/

echo "installing Android secure shell"
sh /system/bin/secure_root/setup.sh

mount -o remount,ro /system

echo "installation complete"

echo "Default password is 'root'"