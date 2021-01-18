FROM pandoc/latex:latest
RUN apk add --no-cache python3 python3-dev py3-pip gcc musl-dev linux-headers && pip3 install --no-cache --upgrade pip setuptools pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos
