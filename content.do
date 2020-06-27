#!/bin/sh

index=./content-org/index.org

redo-ifchange "$index"

progn="(progn
  (package-initialize)
  (require 'ox-hugo)
  (org-hugo-export-wim-to-md :all-subtrees nil nil))"

exec >&2

emacs --batch --visit "$index" --eval "$progn" --kill
