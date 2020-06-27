#!/bin/sh

exec >&2

redo-ifchange ./assets/css/heights.css
redo-ifchange ./content

hugo --cleanDestinationDir
echo "blog.dkendal.com" > ./docs/CNAME
