FROM pandoc/latex:2.17

ENV PYTHONUNBUFFERED=1 \
    PLANTUML_VERSION=1.2022.0
ENTRYPOINT []

RUN apk add --update --no-cache \
    make \
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

COPY plantuml /usr/local/bin/

RUN curl -fsSL http://sourceforge.net/projects/plantuml/files/plantuml.$PLANTUML_VERSION.jar/download -o /usr/local/plantuml.jar && \
    chmod a+r /usr/local/plantuml.jar && \
    chmod +x /usr/local/bin/plantuml

RUN pip install --no-cache --upgrade pandoc-fignos pandoc-tablenos pandoc-secnos pandoc-plantuml-filter

RUN tlmgr update --self && tlmgr install cleveref koma-script

LABEL org.opencontainers.image.source = "https://github.com/buehler/mse-pandoc"
