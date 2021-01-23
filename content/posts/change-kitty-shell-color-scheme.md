+++
title = "Change Kitty terminal color-scheme"
author = ["Dylan Kendal"]
date = 2021-01-20T23:05:00-05:00
lastmod = 2021-01-23T11:16:19-05:00
tags = ["fzf", "kitty", "fish"]
draft = false
weight = 2001
+++

One of the more [persistant complaints](https://github.com/kovidgoyal/kitty/issues?q=is%3Aissue+reload+config) about the Kitty terminal emulator is the
inability to reload configuration. While you can't change every
option at runtime, you can change most display properties on fly if
you enable [remote control](https://sw.kovidgoyal.net/kitty/remote-control.html?highlight=remote%20control) first. After this small tweak you can
change color schemes, window padding, and font sizes on demand in
a single, or all windows; current, and future.

```text
❯ kitty @ --help
Usage: kitty @ [options] command ...

Control kitty by sending it commands. Set the allow_remote_control option to
yes in kitty.conf for this to work.
```

After enabling `allow_remote_control`, we can make use of any of
the [kitty @ set-<cmd> ...](https://sw.kovidgoyal.net/kitty/remote-control.html#kitty-set-colors) commands.

This is what my kitty directory looks like. Normally I use a dark
mode theme (gruvbox.dark.conf), but as my eyes get tired I'll
switch over to my light theme (gruvbox.light.conf).

```text
~/.config/kitty
❯ exa -T
.
├── colors
│  ├── gruvbox.dark.conf
│  ├── gruvbox.light.conf
│  └── snazzy.conf
├── diff.conf
└── kitty.conf
```

{{< highlight bash >}}
kitty @ set-colors --all --configured ~/.config/kitty/colors/gruvbox.light.conf
{{< /highlight >}}

Voilà! `--all` changes all windows as the name implies, dropping
this flag makes the command only target the current window.
`--configured` makes the configuration sticky, and will affect all
new windows in ****this instance****.

You can take this to the next level and create an interactive
CLI script to choose your color scheme. My next post will be on how to
create interactive CLI tools using just FZF!

{{< highlight bash >}}
header="press <enter> to enable colorscheme, <C-c> to exit."
bindings='enter:execute-silent(kitty @ set-colors {})'
preview='bat {}'
find ~/.config/kitty/colors/ -name '*.conf'
    fzf --header "$header" --bind "$bindigs" --preview "$preview"
{{< /highlight >}}

Here it is in action.

<video controls src="/video/1fe86b9a71474352-kitty-fzf-colorscheme-change.webm">
</video>

If you use fish shell you can copy the function below to have a color
scheme toggle with auto completion

{{< highlight fish >}}
# ~/.config/fish/functions/kitty-colorscheme.fish
function kitty-colorscheme -a colorscheme
  kitty @ set-colors --all --configured ~/.config/kitty/colors/$colorscheme.conf
end

set -l colorschemes (fd 'conf' ~/.config/kitty/colors | rg $HOME'/.config/kitty/colors/(.*)\.conf' --replace '$1')

complete -c kitty-colorscheme --no-files --require-parameter --arguments "$colorschemes"
{{< /highlight >}}
