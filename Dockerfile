ARG PYVERSION=3.9.9-slim-bullseye
FROM python:${PYVERSION} as builder

ARG STAGE=builder
COPY install.sh /tmp/
RUN chmod u+x /tmp/install.sh
RUN /tmp/install.sh

RUN python -m venv /opt/venv
RUN /opt/venv/bin/python -m pip install --upgrade pip==21.3.1

ENV PATH=/opt/venv/bin:${PATH}
COPY ./scrapyd.conf /etc/scrapyd/

RUN pip install wheel==0.37.0
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt


FROM python:${PYVERSION} as worker
ARG STAGE=worker
COPY install.sh /tmp/
RUN chmod u+x /tmp/install.sh
RUN /tmp/install.sh

COPY --from=builder /opt/venv /opt/venv
ENV PATH=/opt/venv/bin:${PATH}
COPY ./scrapyd.conf /etc/scrapyd/

EXPOSE 6800

CMD ["scrapyd"]
