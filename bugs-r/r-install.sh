#!/bin/sh
set -e
while read line; do
  package=$(echo $line | awk '{print $1}')
  version=$(echo $line | awk '{print $2}')
  tarball="lib/"$package"_"$version".tar.gz"
  echo "Installing $package ($version)"
  sudo R -e "install.packages(\"$tarball\", repo=NULL)"
done < Rfile
