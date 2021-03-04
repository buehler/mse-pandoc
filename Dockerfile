FROM pandoc/latex:2.11.4

ENV PYTHONUNBUFFERED=1
ENTRYPOINT [ "pandoc" ]

RUN apk add --update --no-cache python3 python3-dev py3-pip py3-setuptools gcc musl-dev linux-headers
RUN pip install --no-cache --upgrade pandoc-fignos pandoc-tablenos pandoc-secnos
