FROM python:3.12-slim
COPY --from=ghcr.io/astral-sh/uv:0.6 /uv /usr/local/bin/uv
COPY requirements.lock /tmp/requirements.lock
RUN uv pip install --system --no-cache -r /tmp/requirements.lock
RUN mkdir /scripts/
COPY ./startup.sh /scripts/startup.sh
RUN chmod u+x /scripts/startup.sh
ENTRYPOINT [ "/scripts/startup.sh" ]
