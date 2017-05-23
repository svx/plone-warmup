#!/bin/bash

# warmup.sh
# A wget based, easy, poor persons`s cache warmer script for Plone sites.

WARMUP_URL='website.com'

wget --quiet https://$WARMUP_URL/sitemap --no-cache --output-document - | egrep -o "http(s?)://$URL[^ \"\'()\<>]+" | while read line; do
if [[ "${line}" == *WARMUP_URL* ]]; then
	newURL=$line
	echo "$newURL"
	wget --quiet -nd -o /dev/null 2>&1 -e robots=off -p -S --header="X-Bypass-Cache: 1" --no-cache "$newURL"
fi
done
