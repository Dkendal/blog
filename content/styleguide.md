+++
title = "Styleguide"
author = ["Dylan Kendal"]
date = 2020-05-07T00:00:00-04:00
lastmod = 2021-01-21T00:02:05-05:00
draft = false
weight = 1001
+++

## Alphabet test {#alphabet-test}

(1)abcdefghijklmnopqrstuvwxyz(2)abcdefghijklmnopqrstuvwxyz(3)abcdefghijklmnopqrstuvwxyz


## Paragraphs {#paragraphs}

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

<hr/>


## Lists {#lists}

-   Lorem ipsum dolor sit amet
    -   Lorem ipsum dolor sit amet
    -   Lorem ipsum dolor sit amet
    -   Lorem ipsum dolor sit amet
-   Lorem ipsum dolor sit amet
    1.  Lorem ipsum dolor sit amet
    2.  Lorem ipsum dolor sit amet
    3.  Lorem ipsum dolor sit amet
-   Lorem ipsum dolor sit amet
    -   [X] Lorem ipsum dolor sit amet
    -   [X] Lorem ipsum dolor sit amet
    -   [ ] Lorem ipsum dolor sit amet
-   Lorem ipsum dolor sit amet
    -   **Lorem:** ipsum dolor sit amet
    -   **Lorem:** ipsum dolor sit amet
    -   **Lorem:** ipsum dolor sit amet


## Block quote {#block-quote}

Here is some text that isn't part of the quote.

> Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
> eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
> ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
> aliquip ex ea commodo consequat. Duis aute irure dolor in
> reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
> pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
> culpa qui officia deserunt mollit anim id est laborum.

Here is some text that follows the quote.


## Source block {#source-block}

{{< highlight elixir >}}
@short :line
{{< /highlight >}}

<br />

{{< highlight elixir >}}
30 char line==================
{{< /highlight >}}

<br />

{{< highlight elixir >}}
50 char line==========================================================
{{< /highlight >}}

<br />

{{< highlight elixir >}}
79 char line===================================================================
79 char line===================================================================
{{< /highlight >}}

<br />

{{< highlight elixir >}}
@this_is a + :very ++ "very"++ "very"++ "very"++ "very"++ "very"++ "very" ++ "very" <> @@very + :very ++ "very"++ "very"++ "very"++ "very"++ "very"++ "very" ++ "very" <> @@very * ~r/long/ ~> ~w(line)
{{< /highlight >}}

<br />

{{< highlight elixir >}}
def at_cursor_pos?(
      {_, [closing: [line: l2, column: c2], line: l1, column: c1], _},
      line,
      col
    )
    when line in l1..l2 and col in c1..c2 do
  true
end
{{< /highlight >}}


## Wide source block {#wide-source-block}

<div class="wide-block">
  <div></div>

{{< highlight elixir >}}
defmodule Refactor do
  use NVim.Plugin
  require Logger

  defmacro is_ast(term), do: is_list(term) or is_tuple(term)

  def init(init_arg) do
    {:ok, init_arg}
  end

  def debug(x) do
    Logger.debug(inspect(x, pretty: true))
  end

  def at_cursor_pos?(ast, {lnum, cnum}), do: at_cursor_pos?(ast, lnum, cnum)

  def at_cursor_pos?(
      {_, [closing: [line: l2, column: c2], line: l1, column: c1], _},
      line,
      col
      )
      when line in l1..l2 and col in c1..c2 do
    true
  end

  # ...

  def count_left_just(string, count \\ 0)
  def count_left_just("", count), do: count
  def count_left_just(" " <> rest, count), do: count_left_just(rest, count + 1)
  def count_left_just(_, count), do: count

  @quoting_opts [columns: true]

  def string_to_quoted(line) do
    Code.string_to_quoted(line, @quoting_opts)
  end
end
{{< /highlight >}}

</div>

<br />


## Example {#example}

```text
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in
reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
```

<br />


## H2 Lorem ipsum dolor sit amet {#h2-lorem-ipsum-dolor-sit-amet}

<br />


### H3 Lorem ipsum dolor sit amet {#h3-lorem-ipsum-dolor-sit-amet}

<br />


#### H4 Lorem ipsum dolor sit amet {#h4-lorem-ipsum-dolor-sit-amet}

<br />


##### H5 Lorem ipsum dolor sit amet {#h5-lorem-ipsum-dolor-sit-amet}

<br />


###### H6 Lorem ipsum dolor sit amet {#h6-lorem-ipsum-dolor-sit-amet}

<br />
