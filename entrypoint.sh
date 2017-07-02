#!/bin/sh

hugo server -w --bind="0.0.0.0" -v -p 80 -d /docs --theme="$MALICE_DOCS_THEME"
