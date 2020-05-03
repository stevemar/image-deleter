#!/bin/bash
#
# Copyright IBM 2018-2020 All Rights Reserved
#
# SPDX-License-Identifier: MIT
#

# This script should be run in the root of a git project. It will find
# images (files ending in jpg, jpeg, and png), check to see if they
# are referenced anywhere in the project using grep, and removed
# if no matches are found.

imagepaths=$(find . -name '*.jpg' -o -name '*.jpeg' -o -name '*.png')
counter=0

for imagepath in $imagepaths; do
    filename=$(basename -- $imagepath)
    if ! grep -q -r --exclude-dir=".git" $filename .; then
        git rm $imagepath
        counter=$((counter+1))
    fi
done

if [ "$counter" -eq "0" ]; then
    echo "No images were removed!"
else
    echo "Removed a total $counter images, w00t!"
fi
