#!/bin/sh
find /var/www/  -name "*.js" -o -name "*.html" -o -name "*.php" -o -name "*.htm"  > cscope.files
cscope -bkq -i cscope.files
ctags -R
mv cscope.* /tmp
