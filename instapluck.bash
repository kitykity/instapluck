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
#echo "Creating list of links..."
#sed 's/\<a href\=\"/\
#\
#/g' export.html | grep "http://instagram.com/" | cut -c1-80 | grep "aria-haspopup" | cut -d"\"" -f1 > ${thisDir}/doig.links
#
#echo "List of post links created."
while read thisLink ; do
#  wget ${thisLink} -O ${thisDir}/index.html | tail -100 | head
  cat ${thisDir}/index.html |grep app_platform | sed 's/\"caption\"\:\"/\
/g' | grep shared_by_author | sed 's/\"\,\".*$//g' > ${thisDir}/caption
  imageLink=`grep "og:image" index.html | cut -d"=" -f3 | sed 's/\"//g' | sed 's/ \/>//g'`
  echo ${thisLink}
  echo ${imageLink}
  cat ${thisDir}/caption
  echo
  sleep 1
done < ${thisDir}/doig.links
