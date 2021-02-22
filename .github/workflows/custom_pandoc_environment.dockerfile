FROM pandoc/latex:latest
RUN apk add --no-cache python3 python3-dev py3-pip ghc gcc cabal musl-dev linux-headers && pip3 install --no-cache --upgrade pip setuptools pandoc-fignos pandoc-eqnos pandoc-tablenos pandoc-secnos && cabal update && cabal install pandoc-citeproc-preamble && tlmgr update --self && tlmgr install adjustbox babel-german background bidi collectbox csquotes everypage filehook footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights needspace pagecolor sourcecodepro sourcesanspro titling ucharcat ulem unicode-math upquote cleveref xecjk xurl zref titlesec
ENV PATH="/root/.cabal/bin:${PATH}"
ENTRYPOINT ["pandoc", "--defaults=pandoc.default.yml"]
