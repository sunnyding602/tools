#!/bin/bash

test -d $1 || exit
test -z $2 && exit

TMP=/tmp
DIR=$1
FILE=$2

find $DIR -type f -name "*.php"   >  $TMP/$FILE.files
find $DIR -type f -name "*.inc"   >>  $TMP/$FILE.files
find $DIR -type f -name "*.js"    >> $TMP/$FILE.files
find $DIR -type f -name "*.css"   >> $TMP/$FILE.files
find $DIR -type f -name "*.sql"   >> $TMP/$FILE.files
find $DIR -type f -name "*.sh"    >> $TMP/$FILE.files
find $DIR -type f -name "*.conf"  >> $TMP/$FILE.files

cscope -b -i $TMP/$FILE.files -f $TMP/$FILE
rm $TMP/$FILE.files
