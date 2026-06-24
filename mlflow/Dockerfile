ARG MLFLOW_VERSION=3.14.0

FROM python:3.12-slim

ARG MLFLOW_VERSION

COPY --from=ghcr.io/astral-sh/uv:0.6 /uv /usr/local/bin/uv

RUN uv pip install --system --no-cache "mlflow==${MLFLOW_VERSION}" psycopg2-binary boto3

RUN mkdir /scripts/
COPY ./startup.sh /scripts/startup.sh
RUN chmod u+x /scripts/startup.sh

ENTRYPOINT [ "/scripts/startup.sh" ]
