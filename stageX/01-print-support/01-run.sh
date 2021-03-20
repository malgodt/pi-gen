#!/bin/bash -e

export PRINTNODE=PrintNode.tar.gz

# Printer drivers
on_chroot <<EOF
#!/bin/bash -e
echo "------------------ Installing SII SLP650 Drivers -----------------------"

wget https://github.com/keithr-git/SeikoSLPLinuxDriver/archive/refs/heads/master.zip
unzip master.zip
cd SeikoSLPLinuxDriver-master
sudo make build
sudo make install
EOF

# PrintNode
on_chroot <<EOF
#!/bin/bash -e
adduser "$FIRST_USER_NAME" lpadmin

echo "------------------ Installing PrintNode -----------------------"

wget https://dl.printnode.com/client/printnode/4.24.1/PrintNode-4.24.1-debian_stretch_buster-armv7l.tar.gz -O ${PRINTNODE}

mkdir -p /usr/local/PrintNode
tar -zxvf $PRINTNODE -C /usr/local/PrintNode --strip-components 1
cd /usr/local/PrintNode

# Use primary user
sed -i 's/user=""/user="${FIRST_USER_NAME}"/' init.sh

cp init.sh /etc/init.d/PrintNode
update-rc.d PrintNode defaults
EOF
