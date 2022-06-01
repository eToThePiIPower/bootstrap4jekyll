---
layout: post
title: "Welcome to Jekyll Bootstrap"
subtitle: "All The Power of Jekyll and Bootstrap 4"
description: Welcome to Jekyll Bootstrap, a new from-scratch iteration at a
             Jekyll theme, written using Bootstrap v4. This is an example post included with the theme.
category: code
tags:
  - sample post
  - Jekyll
date: 2022-05-28T00:00:00-00:00
pre-asides:
  -
    class: warning sticky
    heading: Heads up!
    text: The following post is a sample post. You should probably delete it and
          replace it with some real content.
  -
    class: danger
    heading: Aside notes
    text: You can have multiple pre-sides, but only one pre-aside/aside should be made sticky.
          Also, text in pre-asides will *not* be parsed by the markdown parser. They also won't
          show up in excerpts, which is generally a good thing!
excerpt_separator: <!-- more --> # Defaults to \n\n, i.e. the first paragraph.
---
Welcome to Jekyll Bootstrap, a new from-scratch iteration at a Jekyll theme,
written using [Bootstrap v4](http://getbootstrap.com). By default, the *first paragraph* will appear in the index
summary, complete with **styling**. If you define an `excerpt_separator` in the post's frontmatter,
you can have more or fewer paragraphs in the index excerpts. Try it!

This post can be found in the `_posts` directory, following the convention of
`YYYY-MM-DD-name-of-post.md`.

<!-- more -->

{:.info}
**New as of v0.8.0** You can add callout sections with the `{:.info}`, `{:.success}`, `{:.warning}`, and `{:.danger}`
If you want to make them sticky, change that to `{:.<class>.sticky}`, but make sure you avoid any sticky asides
before the excerpt separator!.

## How to Use Jekyll

Jekyll offers all the power of Markdown, along with extended support for code
snippets and other useful tech blogging tools. You can include code in the
standard Markdown form:

{% comment %}You can make a fenced code block dark like this{% endcomment %}
{:.dark}
```ruby
class Dog
  def bark
    puts 'woof'
  end
end
#=> prints 'woof'
```

Or using Jekyll's Liquid syntax:

{% highlight ruby linenos %}
class Dog
  def bark
    puts 'woof'
  end
end
{% endhighlight %}
