#!/bin/sh

exec >&2

rm ./assets/css/heights.css
redo ./assets/css/heights.css

redo-ifchange ./content

hugo --cleanDestinationDir
echo "blog.dkendal.com" > ./docs/CNAME
