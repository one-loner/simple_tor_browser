#!/bin/bash
if [ -z $1 ]; then
echo "Usage:"
echo ""
echo "stb <URL>"
exit
fi
b=${1:0:4}
#echo $b
if !  echo "${b}" | grep -q "http"; then
  # Add the add char to the end of the input string
  url="https://"$1
else
  url=$1
fi

echo $url > /tmp/stburl
python3 /etc/stb/simple-TOR-browser
size=$(stat --printf="%s" /tmp/stburl)
echo $size
dd if=/dev/urandom of=/tmp/stburl bs=1024 count=$size > /dev/null
dd if=/dev/zero of=/tmp/stburl bs=1024 count=$size > /dev/null
dd if=/dev/urandom of=/tmp/stburl bs=1024 count=$size  > /dev/null
echo "" > /tmp/stburl
rm /tmp/stburl
