+++
title = "Capture the output of a Vim command"
author = ["Dylan Kendal"]
date = 2020-05-07T00:00:00-04:00
lastmod = 2020-06-25T01:55:57-04:00
tags = ["vim"]
draft = false
weight = 2002
+++

Vim ships with an internal pager named "more" for displaying
command output that is used when the entire screen would be filled.
Despite it's name, _more_, it is **not** the command line utility
that you might be familiar with, and because it's a builtin feature vim cannot be configured
to use an alternative (like _less_).

Much like it's namesake, the internal _more_ pager leaves a lot to
be desired, like any ability to search the output. Fortunately, you can
capture the output of any vim expression and display however you want.

Vim provides three means of capturing _messages_: `:redir`,
`execute()` and `:set verbosefile`. We will be focusing on
`execute()` for our purposes. `:redir` can be useful if you just
want to quickly redirect output to a variable, file, register, or
some other source but you generally will rely on `execute()` while
scripting.

General usage is `execute({expr})`, or `execute([{expr}, {expr}])`
for multiple commands. Notice below how the entire output is
concatenated into a single string.

{{< highlight vimrc >}}
:execute('echon "foo"')
'foo'
:execute(['echon "foo"', 'echon "bar"'])
'foobar'
{{< /highlight >}}

Now that we have the output as a string we can write a
function that creates a temporary buffer with the output and opens
a window in the bottom of the current tabpage.

{{< highlight vimrc >}}
function! s:split(expr) abort
let lines = split(execute(a:expr, 'silent'), "[\n\r]")
let name = printf('capture://%s', a:expr)

if bufexists(name) == v:true
execute 'bwipeout' bufnr(name)
end

execute 'botright' 'new' name

setlocal buftype=nofile
setlocal bufhidden=hide
setlocal noswapfile
setlocal filetype=vim

call append(line('$'), lines)
endfunction
{{< /highlight >}}

Or, if you use fzf-vim and you want to search the output you could use it like the below function.

{{< highlight vimrc >}}
function! s:fzf(expr) abort
let lines = split(execute(a:expr, 'silent'), "[\n\r]")

return fzf#run({
\  'source': lines,
\  'options': '--tiebreak begin --ansi --header-lines 1'
\})
endfunction
{{< /highlight >}}

Next we can tie it all together with a _command_ that we easily use
from command mode, and function that will let us choose dumping to a
buffer or searching with fzf on demand.

{{< highlight vimrc >}}
function s:capture(expr, bang) abort
  if a:bang
    call s:fzf(a:expr)
  else
    call s:split(a:expr)
  endif
endfunction

command! -nargs=1 P call s:capture(<q-args>, <bang>0)
{{< /highlight >}}

Here's an example of it capturing the result of `:command` to
populate a buffer with all user defined commands.

{{< figure src="/ox-hugo/2020-06-25_01-20-12_screenshot.png" >}}

Or using `:P! function` to search for all projectionist.vim functions.

{{< figure src="/ox-hugo/2020-06-25_01-23-19_screenshot.png" >}}

Below is the script in its entirety:

{{< highlight vimrc >}}
function! s:split(expr) abort
  let lines = split(execute(a:expr, 'silent'), "[\n\r]")
  let name = printf('capture://%s', a:expr)

  if bufexists(name) == v:true
    execute 'bwipeout' bufnr(name)
  end

  execute 'botright' 'new' name

  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal filetype=vim

  call append(line('$'), lines)
endfunction

function! s:fzf(expr) abort
  let lines = split(execute(a:expr, 'silent'), "[\n\r]")

  return fzf#run({
      \  'source': lines,
      \  'options': '--tiebreak begin --ansi --header-lines 1'
      \})
endfunction

function s:capture(expr, bang) abort
  if a:bang
    call s:fzf(a:expr)
  else
    call s:split(a:expr)
  endif
endfunction

command! -nargs=1 -bang P call s:capture(<q-args>, <bang>0)
{{< /highlight >}}