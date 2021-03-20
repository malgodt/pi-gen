#!/bin/bash -e

# Prepare SSL
echo "------------------ Prepare SSL -----------------------"
c_rehash /etc/ssl/certs

echo "------------------ Installing oh-my-zsh for root -----------------------"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Replace default shell
sed -i "/root/s|/bin/bash|/bin/zsh|" /etc/passwd
sed -i "/${FIRST_USER_NAME}/s|/bin/bash|/bin/zsh|" /etc/passwd

echo "------------------ Installing oh-my-zsh for ${FIRST_USER_NAME} -----------------------"
su - ${FIRST_USER_NAME}
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
