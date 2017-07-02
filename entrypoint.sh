#!/bin/sh

hugo server -w -b "https://$BLOG_URL" --bind="0.0.0.0" -v -p $BLOG_PORT -d /docs
