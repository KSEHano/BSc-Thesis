FROM pandoc/latex:latest
RUN apk add --no-cache python3 python3-dev py3-pip ghc gcc cabal musl-dev linux-headers && pip3 install --no-cache --upgrade pip setuptools pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos && cabal update && cabal install pandoc-citeproc-preamble
ENV PATH="/root/.cabal/bin:${PATH}"
ENTRYPOINT "pandoc --defaults=$PANDOC_CONFIG"