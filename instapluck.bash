#!/bin/bash
# instapluck.bash by Susan Pitman
# Create a really primitive XML file from a list of instagram links.
# 11/19/2014: script created
thisDir=`pwd`

printf "\n<xml>\n\n"
while read pageLink ; do
  curl -s ${pageLink} -o ${thisDir}/index.html
  imageLink=`grep "og:image" ${thisDir}/index.html | cut -d"=" -f3 | sed 's/\"//g' | sed 's/ \/>//g'`
  imageCaption=`grep "\"caption\"" ${thisDir}/index.html | sed 's/.*caption\"\:\"//g' | cut -d"\"" -f1`
  epochDate=`grep "\"date\"" ${thisDir}/index.html | sed 's/.*\"date\"\://' | cut -d"." -f1`
  imageDate=`date -r ${epochDate} '+%m/%d/%Y'`
  printf "  <item>\n    <pagelink>${pageLink}</pagelink>\n    <imagedate>${imageDate}</imagedate>\n    <imagelink>${imageLink}<imagelink>\n    <imagecaption>${imageCaption}</imagecaption>\n  </item>\n\n"
  sleep 5
done < ${thisDir}/links.instapluck
printf "</xml>\n\n"
