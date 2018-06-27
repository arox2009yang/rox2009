#!/bin/bash
yum-config-manager --add http://192.168.4.254/rhel7 &> /dev/null
sed -i '/gpg/s/1/0/' /etc/yum.conf
(yum clean all && yum makecache && yum repolist) &> /dev/null
a=`echo $?`
if [ $a==0 ]
then
echo "yum ok"
else
echo "yum no"
fi
