VERSION 0.6

IMPORT ./scripts/build/ox-hugo AS ox-hugo

markdown:
  FROM ox-hugo+export
  COPY --dir org .
  RUN mkdir static
  RUN --entrypoint
  SAVE ARTIFACT ./content content
  SAVE ARTIFACT ./static static

markdown-watch:
  FROM ox-hugo+export
  ENV EARTHLY true
  ENTRYPOINT ["emacs", "-Q", "--batch", "--load", "$HOME/.emacs.d/watch.el"]

locally-markdown:
  LOCALLY
  COPY +markdown/content ./
  COPY +markdown/static ./

hugo:
  FROM klakegg/hugo:debian
  WORKDIR /app
  COPY . .

build:
  FROM +hugo
  COPY --dir \
    ./static \
    ./themes \
    ./archetypes \
    .
  COPY --dir \
    +markdown/content \
    +markdown/static \
    .
  RUN hugo build --minify --destination /www
  SAVE ARTIFACT /www www

docs:
  LOCALLY
  COPY +build/www ./docs

server:
  LOCALLY
  WITH DOCKER \
    --pull klakegg/hugo:latest \
    --load blog.dkendal.com/emacs:latest=+markdown-watch \
    --compose docker-compose.yml
    RUN docker-compose up --remove-orphans --abort-on-container-exit; docker-compose down -v
  END

repl:
  FROM +emacs
  WORKDIR /app
  COPY . /app
  RUN --interactive emacs --batch --eval "(while t (condition-case err (print (eval (read))) (error (print err))))"
