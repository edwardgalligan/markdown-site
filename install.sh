#!/bin/bash

SERVER_USERNAME=`whoami`
USERNAME=`who am i | awk '{print $1}'`
if [ "$SERVER_USERNAME" != 'root' ] || [ "$USERNAME" == 'root' ]; then
    echo "Please run this command with sudo"
    exit 1;
fi

if [ ! -f /usr/bin/pandoc ]; then
    echo "Pandoc not found"
    echo "Make sure Pandoc is installed to /usr/bin/pandoc and try again"
    exit 1;
fi

cp pandoc-template.html /usr/local/include/
cp pandoc.conf /etc/apache2/conf-available/
a2enmod mime
a2enmod ext_filter
a2enconf pandoc

