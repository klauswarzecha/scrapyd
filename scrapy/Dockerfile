ARG PYVERSION=3.11-slim-bullseye
FROM python:${PYVERSION} as builder

ARG STAGE=builder

WORKDIR /tmp

COPY install.sh .
COPY requirements.txt .

RUN chmod u+x ./install.sh
RUN ./install.sh

RUN python -m venv /opt/venv
RUN /opt/venv/bin/python -m pip install --upgrade pip

ENV PATH=/opt/venv/bin:${PATH}

COPY ./scrapyd.conf /etc/scrapyd/

RUN pip install wheel==0.38.4
RUN pip install -r ./requirements.txt


FROM python:${PYVERSION} as worker
ARG STAGE=worker

COPY --from=builder /opt/venv /opt/venv
ENV PATH=/opt/venv/bin:${PATH}
COPY ./scrapyd.conf /etc/scrapyd/

ARG DEFAULT_PORT=6800
ENV PORT ${DEFAULT_PORT}
EXPOSE $PORT

CMD ["scrapyd", "--pidfile="]
