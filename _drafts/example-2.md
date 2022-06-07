---
layout: post
title: "Example Post 2: Interactive Shell Demo"
subtitle: "Something New"
date: 2022-05-27T22:00:00+00:00
published: true # set to false if you want

description: # Used in atom/rss feeds & OpenGraph etc.
  This description will be used in atom/rss feeds, OpenGraph,
  Twitter cards, etc.
category: # life
tags: [shell, linux, Jekyll, sample post]
sharing: true # Defaults to true, change to false or delete
comments: true # Defaults to true, change to false or delete

pre-asides: # Add as many notices as you want, or delete this block
  - class: danger sticky # primary, info, success, warning, danger
    heading: Preview draft
    text:
      This post is an example post. If you can see this message, the post was
      probably published by mistake.
  - class: info
    heading: Detailed demonstration example
    text:
      This post is a detailed demonstration of the `console` lexer for 
      `rouge`, and how it can be used in Jekyll. It can be safely deleted, or 
      kept as unpublished for future reference.
  - class: warning
    heading: Includes unreleased features
    text:
      The `rprompt` or `root` options shown here are not part of the official 
      `rouge` release, but can be found on my fork under the
      `feature.root-prompt` branch. 
---

This post is an example post. If you can see this message, the post was
probably published by mistake.

Demonstration of the `console` lexer, also available under the names `shell-session` and `terminal`

{:.dark.80col}
```console?lang=shell&error=[2022&comments=true&rprompt=%
jdoe@jekyll $ cd ~jdoe/Code/blog
jdoe@jekyll $ jekyll serve --drafts --livereload
Configuration file: /home/jdoe/Code/blog/_config.yml
            Source: /home/jdoe/Code/blog
       Destination: /home/jdoe/Code/blog/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 2.552 seconds.
 Auto-regeneration: enabled for '/home/cbeynon/Projects/eulerpi'
    Server address: http://127.0.0.1:4000
  Server running... press ctrl-c to stop.
[2022-06-02 09:49:30] ERROR `/favicon.ico' not found.
^C
# You can specify errors to highlight
jdoe@jekyll $ su - # Root prompts require a patched rouge
jekyll % rm -rf /
# See (link upcoming) for my post on the patched rouge for root prompts as as as
```

Options available to ```` ```console?```` include:

`lang`
: A shell language to lex on, defaults to `shell`, but it can be *any*
  language supported by `rouge`. For example, setting `lang` to `elixir`
  will style an `iex` session, which doesn't have explicit support as a
  language the way `irb` does.

`prompt`
: A comma-separated list of markers for the end of a prompt.
  Defaults to `$,#,%,>`, or `$,%,>` if comments are explicitly enabled.

`rprompt`
: Marks the end of a root prompt, only available in my patched
  [`rouge`](https://github.com/etothepiipower/rouge)

`comments`
: Either `true` or `false` to explicitly controller comments.
  Defaults to `:guess`, which guesses bases on the presence/absence of `#`
  in the `prompt` (and `rprompt` in my patched `roughe`).

`errors`
: A comma-separated list marking the *beginning of error lines in the output.
