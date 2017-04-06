---
layout: post
title: "Resty and JQ"
subtitle: "Simple REST API Testing and JSON Parsing from the Shell"
date: 2015-11-11T20:06:18-05:00
category: dev
modified:
tags:
  - shell
  - REST
  - JSON
comments: true
sharing: true

---

Resty turns this:

{% highlight shell_session %}
$ curl -sLv  "" -X GET -b /path/to/cookie -c /path/to/cookie/jar "" "" "" \
"http://api.wunderground.com/api/API_KEY/conditions/q/NY/New_York.json"
{% endhighlight %}

into this

{% highlight shell_session %}
$ GET /conditions/q/NY/New_York.json
{% endhighlight %}

Testing an application with a REST API from the command line normally
necessitates complex invocations of curl, especially when using verbs other
than the basic `GET`. [Resty][resty] is a tool by [Micha Niskin][micha] that
makes it a breeze.

<!-- more -->

# Installation

Resty can be installed by following the instructions from the
[Resty GitHub site][resty]. Alternatively, just run the following from
anywhere in your path (such as `~/bin`) to install the script.

{% highlight shell_session %}
$ curl -O https://raw.githubusercontent.com/micha/resty/master/resty
$ chmod +x resty
{% endhighlight %}

We need to initiate Resty before using it, so either add the following to the
end of your `.zshrc` or just run it in your shell session (don't forget the
space in the middle)

{% highlight shell_session %}
$ resty
{% endhighlight %}

## A Quick Fix for Zsh

Note for zsh users: there is a bug in the current `master` branch with the lines
split by new lines. Running the following replacement from Vim fixed it for me.
There is a commit on the GitHub issues which seems to fix it, and if you're
reading this significantly after November 2015 chances are the fix is already
merged.
{% highlight vim %}
%s/\\\n\s\+//
{% endhighlight %}

# Pointing to a base URL

Resty needs to be pointed to a base URL in order to use it. The example I gave
above is from Weather Underground: you can grab a [Free API Key][wunderground]
to follow along.

Now that you have your key, run the following from the shell:
{% highlight shell_session %}
$ resty http://api.wunderground.com/api/<APIKEYHERE>
http://api.wunderground.com/api/<APIKEYHERE>
{% endhighlight %}

At any time, running the `resty` command will display the base URL, which is
handy if you switch between APIs often. Just keep this in mind if you store
sensitive data (like API keys) there, it will be easily visible to anyone else
on the console.

## Testing it out

Now we can run some simple queries:
{% highlight shell_session %}
$ GET /conditions/q/NY/New_York.json
{% endhighlight %}

If you're using Resty with your own small API, you may be fine. However, Rails
(and perhaps oter frameworks) minifies JSON by default, making it difficult to
parse. For larger and espcially large third-party APIs like Weather
Underground's, you'll get a huge JSON document in response.

So we've got the requests made easy, but what can we do to tame the responses?

# Using jq to parse json data from Resty

If you don't already have jq installed, now's a good time. I'm going to write
up another post in more detail on jq, but for now we'll using it simply for
syntax coloring, prettification, and pulling out single values

{% highlight shell_session %}
$ brew install jq
{% endhighlight %}

Now we can use jq to pick out the parts we're interested in.[^1]

{% highlight shell_session %}
$ GET /conditions/q/NY/New_York.json | jq .current_observation.observation_location
{
  "full": "Chelsea, West 28th St., New York, New York",
  "city": "Chelsea, West 28th St., New York",
  "state": "New York",
  "country": "US",
  "country_iso3166": "US",
  "latitude": "40.746910",
  "longitude": "-73.992836",
  "elevation": "110 ft"
}
$ GET /conditions/q/NY/New_York.json | jq .current_observations.temp_f
52
{% endhighlight %}

On a smaller API (such as the Twitter-like clone I'm building) that minifies by
default, you can use jq to make prettify the text, and give it syntax coloring.

{% highlight shell_session %}
$ GET /user/1.json
{"user":{"id":1,"email":"test@example.com","created_at":"2015-11-09T08:16:17.129
Z","updated_at":"2015-11-11T18:18:35.737Z","name":"Example User","username":"Som
eGuy","gravatar_url":"https://secure.gravatar.com/avatar/<somehash>.png?r=PG"}}
$ GET /user/2.json | jq
{
  "user": {
    "id": 1,
    "email": "test@example.com",
    "created_at": "2015-11-09T08:16:17.129Z",
    "updated_at": "2015-11-11T18:18:35.737Z",
    "name": "Example User",
    "username": "SomeGuy",
    "gravatar_url": "https://secure.gravatar.com/avatar/<somehash>.png?r=PG"
  }
}
{% endhighlight %}

This is particularly noticeabl when returning arrays of objects, which quickly
become unreadable by humans when minified.

Combining Resty and jq is an extremely powerful way to test your JSON APIs,
as well as to experiment with third-party ones.

[resty]: https://github.com/micha/resty "micha/resty"
[micha]: https://github.com/micha "Micha Niskin"
[wunderground]: http://www.wunderground.com/weather/api/d/docs?MR=1 "API | Weather Underground"
[^1]: Be careful when experimenting you don't go over your API call quota, espcially when using an external API with a free account. You may want to cache the results from Resty to a file, then cat those into jq
