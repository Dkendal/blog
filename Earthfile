VERSION 0.6

# IMPORT ./scripts/build/ox-hugo AS export

markdown:
  FROM ./scripts/build/ox-hugo+export
  COPY --dir content-org .
  RUN mkdir static
  RUN --entrypoint
  SAVE ARTIFACT ./content content
  SAVE ARTIFACT ./static static

hugo:
  FROM klakegg/hugo:debian
  WORKDIR /app
  COPY --dir ./content ./static ./themes .
  COPY ./config.toml .

  WORKDIR /app

build:
  FROM +hugo
  RUN --entrypoint build

server:
  FROM +hugo
  EXPOSE 1313
  RUN --interactive --entrypoint server


locally-markdown:
  LOCALLY
  COPY +markdown/content ./
  COPY +markdown/static ./

all:
  FROM +emacs
  WORKDIR /app
  COPY . /app
  RUN emacs --script ./scripts/build/main.el

repl:
  FROM +emacs
  WORKDIR /app
  COPY . /app
  RUN --interactive emacs --batch --eval "(while t (condition-case err (print (eval (read))) (error (print err))))"
