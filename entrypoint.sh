#!/bin/sh

# default to `hugo-material-docs` if theme is not supplied
THEME="${MALICE_DOCS_THEME:-hugo-material-docs}"
BASE_URL="${MALICE_DOCS_URL:-docs.malice.io}"
PORT="${MALICE_DOCS_PORT:-443}"

hugo server -vDEF --watch=false --bind="0.0.0.0" --port=$PORT --theme="$THEME" --baseURL="$BASE_URL"
