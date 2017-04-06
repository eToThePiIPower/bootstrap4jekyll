---
layout: post
title: "Spellcheck your Markdown in Vim"
subtitle: A Quick Tutorial to Setting Up and Using Spell
date: 2015-06-12 17:51:34 12 -0400
category: ops
tags:
    - markdown
    - vim
comments: true
sharing: true
---
Vim comes built-in with a [spell-checker][1] as powerful as graphical text editors
like Sublime and Atom, but it isn't enabled by default because it generally
isn't handy when writing source code. It *can* be handy though when writing
documentation, blog posts, or other in markdown (or your favorite documentation
syntax).

<!-- more -->

# Configuration

First to enable it automatically for all markdown files[^1], add the following to
your `~/.vimrc` configuration file:

{% highlight vim %}
autocmd Filetype mkd setlocal spell
{% endhighlight %}

This loads the default, all-regions English dictionary, which includes all
regional variations (e.g. color, colour). You can use the `spelllang` option to
pick a language/region, as shown here placed in an `augroup` with other
Markdown-specific settings:

{% highlight vim %}
augroup Markdown
    autocmd Filetype mkd set shiftwidth=4
    autocmd Filetype mkd setlocal spell spelllang=en_us
augroup END
{% endhighlight %}

The language/region can also be specified separately, e.g. by `set spelllang=en_gb`.
Multiple languages, delimited by commas, can be loaded. For example
`set spelllang=nl,de,en_ca` will load Dutch, German, and Canadian English
word lists. Spelling regions have the same format as system locales
(but all lowercase), and Vim will offer to download spelling lists for you
on demand.

# Basic Usage

## Commands

{:.sidebar .right}
`[s` and `]s`
: Skips to the previous and next misspelled word

`[S` and `]S`
: Skips to the previous and next misspelled word, ignoring regional, rare, and capitalization
misspellings

`z=`
: See a list of suggested spellings

`zg` and `zug`
: Add the word to the Good spelling list permanently, or Undo adding the word to the Good list

`zG` and `zuG`
: Add the word to the Good spelling list for this session only, or Undo adding the word to the Good list

`zw`
: Add the word to the Wrong words (i.e. misspelled) list. Follows the same pattern
  as above for *zuw*, *zW*, and *zuW*

As you type, words that are not in one of the word lists from `spelllang`
will be highlighted.
From **normal mode**, you can navigate between spelling errors using the square
brackets followed by lowercase/uppercase `s`.
Once you have a word under the
cursor you can manipulate misspelled words with `z` followed by a command like
`=` for suggestions, `g`, to mark as Good, `w` to mark as Bad, and `ug`/`uw`
to undo the previous.
Details are given in the sidebar.

## Display

Spelling errors are highlighted in colors depending on the kind of spelling
error. While the specific colours depend on your Vim and/or terminal's color
scheme, the included screenshot shows examples of: uncapitalized proper nouns,
in purple; uncapitalized sentence-starters, in blue; region-specific
misspellings, also in blue; and completely unknown words, in red. Also supported
are rare words, but I've yet to come across any.

# Ignoring Liquid Tags

Vim's spell check automatically ignores any code in fenced code blocks
(that is, backticks). It doesn't not, however, ignore code in Liquid
code blocks, or Liquid attributes themselves. Fixing this involves
modifying the syntax definitions for Markdown, which will be discusses in
an upcoming post.

[1]: http://vimdoc.sourceforge.net/htmldoc/spell.html "Vim documentation: spell"
[here]: https://en.wikipedia.org/wiki/Here_document#Ruby "Here documents (#Ruby)"

[^1]:   Technically, you can enable spell check for all files, but Markdown and
        text documents are about the only times it's really useful. The syntax
        definitions for most programming languages turn off the spell checker
        everywhere but comments, including strings and [HERE documents][here].
