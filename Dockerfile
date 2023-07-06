FROM python:3

ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
COPY entrypoint.sh /entrypoint.sh
RUN pip install ansible-builder \
  && chmod +x /tini \
  && chmod +x /entrypoint.sh

ENTRYPOINT ["/tini", "--", "/entrypoint.sh"]
