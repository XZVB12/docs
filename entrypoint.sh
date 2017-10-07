#!/bin/sh

# default to `hugo-material-docs` if theme is not supplied
hugoTheme="${MALICE_DOCS_THEME:-hugo-material-docs}"

hugo server -D --watch=false --bind="0.0.0.0" -v -p 80 --theme="$hugoTheme"
