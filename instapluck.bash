#
#
#
#
           ' NOTE!!! This script is a work in progress and IS NOT COMPLETE!!! '
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#!/bin/bash
thisDir=`pwd`
sed 's/\<a href\=\"/\
\
/g' export.html | grep "http://instagram.com/" | cut -c1-80 | grep "aria-haspopup" | cut -d"\"" -f1 > ${thisDir}/doig.links

echo "List of post links created."
while read thisLink ; do
#  wget ${thisLink} | tail -100 | head
  echo ${thisLink}
  sleep 1
done < ${thisDir}/doig.links

