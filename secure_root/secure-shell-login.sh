#!/system/bin/sh

dir="" #define directory
sec="secure" #secure folder
pwd="passwd" #password secure filename
pwdstore=$dir/$sec/$pwd #full secure path

secpass=$($pwdstore) # get secured password
pass="" #initialize variable


function seclog {
echo -e "Enter password to continue:"
stty -echo
read passwd
stty echo

pass=$passwrd

chkpass=$(echo $passwrd | md5sum | awk '{print $1}')

'$1'

}


function chkpss {
if['$chkpass' == '$secpass'];
then
su
echo $USER 'access granted' $(date)
else
echo $USER 'wrong passwd try again'
fi
}

seclog chkpss