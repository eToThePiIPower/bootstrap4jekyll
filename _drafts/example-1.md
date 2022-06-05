---
layout: post
title: "Example Post 1"
subtitle: "Old "
date: 2022-05-27T00:00:00+00:00
published: true # set to false if you want

description: # Used in atom/rss feeds & OpenGraph etc.
  This description will be used in atom/rss feeds, OpenGraph,
  Twitter cards, etc.
category: code
tags: [ruby, javascript]
sharing: true
comments: true

pre-asides: # Add as many notices as you want, or delete this block
  - class: warning sticky-xs # primary, info, success, warning, danger
    heading: Preview draft
    text:
      This post is an example post. If you can see this message, the post was
      probably published by mistake.
---

This post is an example post. If you can see this message, the post was
probably published by mistake.

You can include code from external files using the `included_code` Jekyll tag (which is aliased to `render_code`). Using this tag, you can make use of features such as figure titles, download links,
and highlighting selected lines.

One consideration to keep in mind here is that HEREDOC-style strings are not escaped properly, which
will corrupt your html document if they are used inside your included code. As in the highlighted
portions below, you can comment out those sections to render the code block correctly.

The standard stylesheet uses the same `xcode` theme the rest of the codeblocks use. As with other code blocks, I've enabled a `dark` style here as well, used in the same way by adding `{:.dark}` before the `include_code` tag.

{:.dark}
{% render_code example.rb title:"Example Ruby File" lang:ruby mark:37-46,50-59,63-72 url:test.rb %}