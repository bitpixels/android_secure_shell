#!/system/bin/sh

dir="" #define directory
sec="secure" #secure folder
pwd="passwd" #password secure filename
pwdstore=$dir/$sec/$pwd #full secure path
dfltpwd="root"

if[ ! -f $pwdstore ]; # if folder structure does not exist
then
echo "creating password store"
touch $pwdstore #create folder structure
echo "setting default password"
dfltpass=$(echo $dfltpwd | md5sum | awk '{print $1}') #checksum default password
$(echo $dfltpass > $pwdstore) #set default password
echo "securing password store"
chown root:root $pwdstore #secure user & group to root
chmod 700 $pwdstore #secure permission to root
echo "password store setup"
fi