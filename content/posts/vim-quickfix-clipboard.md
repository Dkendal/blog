+++
title = "Create a vim quickfix list from the clipboard"
author = ["Dylan Kendal"]
date = 2020-05-07T00:00:00-04:00
lastmod = 2020-06-19T01:49:49-04:00
tags = ["vim"]
draft = false
weight = 2001
+++

Do you find yourself editing a buffer containing file paths and you
want to quickly switch between them?

The `:cex[pr][!} {expr}` command executes any valid vim expression
(`{expr}`) and constructs a quickfix list from each string of the output.

Assuming you've `set clipboard` to `unnamed` or `unamedplus`, you
can supply the clipboard register (`@*`, or `@+` respectively) as a
vim expression.

{{< highlight vim "linenos=table, linenostart=1" >}}
"assuming :set clipboard=unnamed
:cex @*
{{< /highlight >}}

or:

{{< highlight vim >}}
"assuming :set clipboard=unnamedplus
:cex @+
{{< /highlight >}}

Now you can set the quickfix to the current contents of your
clipboard, note that your input will still have to match your [errorformat](https://neovim.io/doc/user/options.html#'errorformat').

<div class="block"><script id="asciicast-SHFPgdNJTVOH9j8RkSyQpQ2uz" src="https://asciinema.org/a/SHFPgdNJTVOH9j8RkSyQpQ2uz.js" async></script></div>