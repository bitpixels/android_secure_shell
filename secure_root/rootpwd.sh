#!/system/bin/sh

dir="" #define directory
sec="secure" #secure folder
pwd="passwd" #password secure filename
pwdstore=$dir/$sec/$pwd #full secure path


function passwdexec {
if['$1' == '-change'];
then
secpwd
else
cat $pwdstore
fi
}


function secpwd {
echo -e "Enter current password for $USER'
stty -echo
read curpwd
stty echo

curpwd=$(echo $curpwd | md5sum | awk '{print $1}')
hashpwd=$(passwdexec)
echo hash $hashpwd checkhash: $curpwd
if['$curpwd' == '$hashpwd'];
then
setpwd
else
secpwd
fi
}

}


function setpwd {
echo -e "Enter new password for $USER'
stty -echo
read newpasswd
styy echo


echo -e "Confirm new password for $USER'
stty -echo
read confpasswd
stty echo


echo password $newpasswd
echo confirm password $confpasswd

if['$newpasswd' == '$confpasswd'];
then
mount -o remount,rw /system
storepwd=$(echo $confpasswd | md5sum | awk '{print $1}')
$(echo $storepwd > $pwdstore)
mount -o remount,ro /system
echo password changed for $USER
echo password hash: $storepwd
fi
}

passwdexec $1