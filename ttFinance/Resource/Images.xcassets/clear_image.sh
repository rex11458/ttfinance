#!/bin/sh
PROJ=`find . -name '*.xib' -o -name '*.storyboard' -o -name '*.[mh]'`

for png in `find . -name '*.png'`
do
name=`basename $png`
if ! grep -qhs "$name" "$PROJ"; then
echo "$png is not referenced"
fi
done
