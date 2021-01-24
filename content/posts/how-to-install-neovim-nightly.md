+++
title = "How to install Neovim nightly"
author = ["Dylan Kendal"]
date = 2021-01-24T13:02:00-05:00
lastmod = 2021-01-24T13:03:11-05:00
tags = ["vim"]
draft = false
weight = 2001
+++

Here's a quick little script that you can use build and install the
most recent release of Neovim.

{{< highlight bash >}}
#!/bin/bash
cd ~ || exit 1
sudo rm -r neovim || true
git clone https://github.com/neovim/neovim
cd neovim || exit 1
sudo make CMAKE_BUILD_TYPE=Release install
cd ~ || exit 1
sudo rm -r neovim
{{< /highlight >}}

I've used this on both Linux and Mac OSX without issue. This script
was originally posted on a Neovim GitHub issue tracker which I've
long since forgotten.

More options for the make install task [here](https://github.com/neovim/neovim/wiki/Installing-Neovim).
