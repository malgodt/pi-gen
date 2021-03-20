dpkg-reconfigure locales # add the en_GB.UTF-8 locale and set as default
export LANGUAGE=${LOCALE_DEFAULT}
export LANG=${LOCALE_DEFAULT}
export LC_ALL=${LOCALE_DEFAULT}
locale-gen ${LOCALE_DEFAULT}
update-locale ${LOCALE_DEFAULT}
