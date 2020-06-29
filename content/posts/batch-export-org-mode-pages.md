+++
title = "Batch export Org-mode pages"
author = ["Dylan Kendal"]
date = 2020-06-27T18:03:00-04:00
lastmod = 2020-06-28T22:58:12-04:00
tags = ["emacs", "orgmode", "hugo"]
draft = false
weight = 2001
+++

A common task if - like me - you use _Org-mode_ to create static
websites; is to export the document to your destination format.
Take this blog for instance. It's written in _Org-mode_, which is
exported to _markdown_ for use by _Hugo_ which will then compile it
to _HTML_. The obvious choice for exporting your content would be
to call the command directly within Emacs, but say you wanted to do
this as a part of some other build process or as part of an
automated continuous deployment process it would be necessary to
invoke the export command from the shell.

Fortunately, Emacs provides the ability to use it in a non-interactive
manner via the `--batch` flag.

```text
--batch                     do not do interactive display; implies -q
--no-init-file, -q          load neither ~/.emacs nor default.el
```

Running Emacs in batch mode we just need to open our _Org-mode_
document, either programmatically or with the `--visit FILE` flag, load
whatever _Org-mode exporter_ library, and call its export function. I'm
using _ox-Hugo_ so that's what'll I'll require. It's also necessary to
ensure the Emacs can load this library; the easiest way I
know how to do this is to call `(package-initialize)`, which loads _all_
packages so I don't need to adjust load paths or load individual
packages.

The solution to my particular situation where I'm exporting the
entire document to markdown intended for Hugo as part of a build
process on my machine looks like this:

{{< highlight shell >}}
#!/bin/sh

index=./content-org/index.org

progn="(progn
  (package-initialize)
  (require 'ox-hugo)
  (org-hugo-export-wim-to-md :all-subtrees nil nil))"

emacs --batch --visit "$index" --eval "$progn" --kill
{{< /highlight >}}

The `--eval` flag is used to run by export commands, but you
could  have just as easily put these command in their own _dot el_ file
and load that - or put each _sexp_ as it's own argument to
`--eval`.

Note that this isn't tested for a continuous deployment environment
and you'd likely have to adjust a few things to ensure that
packages are available and whatnot.

Only three posts in and I've already managed to make a meta post
about how this blog is created.