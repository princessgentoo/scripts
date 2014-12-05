#! /bin/bash
#set -xv
mkdir -p /tmp/imgs
cd /tmp/imgs
grep "\[img\]"  "$1" | sed "s/\[url.*\].*\[\/img\]//g" | sed "s/\[img\]//g" | sed "s/\[\/img\]//g" |  sed "s/\[\/url\]//g" | sed "s/\[align=center\]//g"| sed "s/\[\/align\]//g" > /tmp/list
unset a
for p in $(cat /tmp/list);   do a=$(( $a + 1)); b=$(echo $a | sed 's/\<[0-9]\>/0&/');  wget -O "$b" "$p"; done
for p in *; do imgur "$p" 2> /dev/null >> /tmp/lista ; done
sed "s/$/\[\/img]/g" /tmp/lista |  sed "s/^/\[img\]/g" | tee  ~/lista
rm /tmp/lista
rm /tmp/imgs/*

