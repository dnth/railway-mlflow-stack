#!/bin/sh
echo 'starting mlflow server...'

exec mlflow server \
    --backend-store-uri $DB_URL \
    --serve-artifacts \
    --artifacts-destination s3://bucket \
    --allowed-hosts "${MLFLOW_ALLOWED_HOSTS:-*}" \
    --cors-allowed-origins "${MLFLOW_CORS_ALLOWED_ORIGINS:-*}" \
    --host :: \
    --port ${PORT:-5000}
