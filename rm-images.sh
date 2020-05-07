# Copyright IBM 2018-2020 All Rights Reserved
#
# SPDX-License-Identifier: MIT
#

# This script should be run in the root of a git project. It will find
# images (files ending in jpg, jpeg, and png), check to see if they
# are referenced anywhere in the project using grep, and removed
# if no matches are found.

[[ -n ${DEBUG} ]] && set -eox

if ! [ -z $1 ]; then
    if [[ -d $1 ]]
    then
        cd $1
    fi
fi

echo "Looking for unused images in $(pwd)"

imagepaths=$(find . -name '*.jpg' -o -name '*.jpeg' -o -name '*.png')
counter=0

for imagepath in $imagepaths; do
    filename=$(basename -- $imagepath)
    if ! grep --exclude-dir '.git' -q -r $filename .; then
        git rm $imagepath
        counter=$((counter+1))
    fi
done

if [ "$counter" -eq "0" ]; then
    echo "No images were removed!"
else
    echo "A total of $counter images were marked for removal, w00t!"
fi
