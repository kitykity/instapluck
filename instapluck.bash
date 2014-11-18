#
#
#
#
            NOTE!!! This script is a work in progress and IS NOT COMPLETE!!!
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

while read thisLink ; do
  curl ${thisLink}
  sleep 5
done < ${thisDir}/doig.links
