#!/bin/sh
if [ -z "${AWS_LAMBDA_RUNTIME_API}" ]; then
    exec ts-node server.ts
else
    exec /usr/local/bin/npx aws-lambda-ric $1
fi
