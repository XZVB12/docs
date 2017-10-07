#!/bin/sh

# default to `hugo-material-docs` if theme is not supplied
hugoTheme="${MALICE_DOCS_THEME:-hugo-material-docs}"

hugo server -vDEF --watch=false --bind="0.0.0.0" --port=80 --theme="$hugoTheme"
