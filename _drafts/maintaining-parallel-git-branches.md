---
layout: post
title: "Maintaining Parallel Git Branches"
subtitle: A Use Case for Multiple Permanent Branches and Remotes

---

Sometimes you need to maintain multiple, parallel git branches, and occasionally
merge changes from one to the other. For example, for this blog I maintain a
`master` branch for just the template, stripped of any personalizations, and
shared on Github; I also have a separate branch including my personalized
configuration, posts, and other data, which are pushed to a private Bitbucket
repository. This setup goes beyond what many introductory Git tutorials teach,
but is extremely useful for anyone who wants to use an open source project (like
a Jekyll theme), and add their own customizations while keeping the base project
updated.

# The Scenario

When I make changes to the template, I
merge them into the `blog` branch, using merge commits to maintain the history
of the blog. Occasionally I decide a feature I added in the blog branch deserves
to be in the main template; for those cases, I use a cherry pick.

# Setting Up the Original Repository

# Using The Repository

## Git Merge --no-ff

## Git Cherry-Pick

# Setting Up Remotes

## The Origin Remote

## The Blog Remote

# Cloning to a New Machine

## Cloning the Origin Remote

## Adding & Fetching the Blog Remote

## Creating the Blog Branch

# Final Thoughts

