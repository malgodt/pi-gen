#!/bin/bash -e

echo "Adding Oh My ZSH config"

echo "DISABLE_AUTO_UPDATE=true" >>"${ROOTFS_DIR}"/home/"${FIRST_USER_NAME}"/.zshrc
echo "DISABLE_AUTO_UPDATE=true" >>"${ROOTFS_DIR}"/root/.zshrc
