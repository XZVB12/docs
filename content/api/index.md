---
title: API
weight: 60
---

The Malice HTTP API gives you full access to Malice via HTTP. Every aspect of Malice can be controlled via this API. The Malice CLI uses the HTTP API to access Malice.

## Version Prefix

All API routes are prefixed with /v1/.

This documentation is only for the v1 API.

## Transport

The API is expected to be accessed over a TLS connection at all times, with a valid certificate that is verified by a well behaved client. It is possible to disable TLS verification for listeners, however, so API clients should expect to have to do both depending on user settings.

## HTTP Status Codes

The following HTTP status codes are used throughout the API.

 - 200 - Success with data.
 - 204 - Success, no data returned.
 - 400 - Invalid request, missing or invalid data.
 - 403 - Forbidden, your authentication details are either incorrect or you don't have access to this feature.
 - 404 - Invalid path. This can both mean that the path truly doesn't exist or that you don't have permission to view a specific path. We use 404 in some cases to avoid state leakage.
 - 429 - Default return code for health status of standby nodes, indicating a warning.
 - 500 - Internal server error. An internal error has occurred, try again later. If the error persists, report a bug.
 - 503 - Malice is down for maintenance or is currently sealed. Try again later.
