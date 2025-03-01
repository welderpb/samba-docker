#!/bin/sh

#add smb users from file
tr -d '\r' </opt/smbusers | while read USER
do
    IFS=':' read -r user uid pass <<EOF
$USER
EOF
    addgroup -g ${uid} ${user}
    adduser -u ${uid} -G ${user} -G users -H -h /var/empty -D -s /sbin/nologin ${user}
    echo "${pass}" | tee - | smbpasswd -s -c /etc/samba/smb.conf -a ${user}
done

exec smbd "$@"
