#!/bin/bash
thisDir=`pwd`

while read pageLink ; do
  wget ${pageLink} -O ${thisDir}/index.html | tail -100 | head
  imageLink=`grep "og:image" ${thisDir}/index.html | cut -d"=" -f3 | sed 's/\"//g' | sed 's/ \/>//g'`
  imageCaption=`grep "\"caption\"" ${thisDir}/index.html | sed 's/.*caption\"\:\"//g' | cut -d"\"" -f1`
  echo ${pageLink}
  echo ${imageLink}
  echo ${imageCaption}
  echo
  sleep 10
done < ${thisDir}/links.instapluck
