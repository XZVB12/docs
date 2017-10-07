#!/bin/sh

# default to `hugo-material-docs` if theme is not supplied
THEME="${MALICE_DOCS_THEME:-hugo-material-docs}"
BASE_URL="${MALICE_DOCS_URL:-docs.malice.io}"

hugo server -vDEF --watch=false --bind="0.0.0.0" --port=443 --theme="$THEME" --baseURL="$BASE_URL"
