FROM pandoc/latex:2.11.4

ENV PYTHONUNBUFFERED=1 \
    PLANTUML_VERSION=1.2021.2
ENTRYPOINT [ "pandoc" ]

RUN apk add --update --no-cache \
    python3 \
    python3-dev \
    py3-pip \
    py3-setuptools \
    gcc \
    musl-dev \
    linux-headers \
    openjdk11 \
    curl \
    graphviz \
    ttf-droid \
    ttf-droid-nonlatin

RUN curl -fsSL http://sourceforge.net/projects/plantuml/files/plantuml.$PLANTUML_VERSION.jar/download -o /usr/local/plantuml.jar && \
    chmod a+r /usr/local/plantuml.jar

COPY plantuml /usr/local/bin/

RUN pip install --no-cache --upgrade pandoc-fignos pandoc-tablenos pandoc-secnos pandoc-plantuml-filter && \
    tlmgr update --self && tlmgr install cleveref
