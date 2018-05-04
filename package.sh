#!/bin/bash

# packaging script for spinnaker-demo, puts a flat file
# release into a deb package for artifacting and packing via
# jenkins/packer/spinnaker

# Expects an arg representative of the package version (something like
# SEMVER-COMMIT)

# Expects to run after 'build.sh' script which manages the 'build' and
# 'build/html' directories

version=$1
buildfolder=spinnaker-demo_$version
debdir=build/$buildfolder
mkdir -p $debdir
mkdir -p $debdir/opt/spinnaker-demo
mkdir -p $debdir/etc/nginx/sites-available/
cp -r package/DEBIAN $debdir
cp package/nginx-spinnaker-demo $debdir/etc/nginx/sites-available/spinnaker-demo
mv build/html/* $debdir/opt/spinnaker-demo/

# Version:
sed -i "s/VERSION/$1/" $debdir/DEBIAN/control
echo "Building version $1"

# build it in 'build' so cleanup is easier (delete the build dir)
cd build
dpkg-deb --build $buildfolder
