# Bootstrap4Jekyll

A Bootstrap 4 Theme for Jekyll using a mostly clean design. Incorporates a
print- and mobile-responsive résumé builder. This work is in its early stages
and many nice features (like category pages, pagination, comments, xml feeds,
etc) are yet to be implemented.

## How to Use

1.  Clone or download the repository
2.  Create a branch `yoursite`. This will make it easier to pull in updates
    later. 
3.  Edit the example posts and configurations, including:
    *   Update variables in `_config.yml`
    *   Sign up for Disqus and replace the shortname
        - Alternatively, delete the entry if you don't want to use comments
    *   Write about yourself in `about.md`
4.  Customize the resume builder, including:
    *   `_data/resume.yml` for the main block
    *   `_resume-cards/*.md` for individual cards such as skills, projects, etc
    *   `_resume-jobs/*.md` for jobs in the 'Experience' card

TODO: Go into more detail.

## Planned Features

The following will likely be implemented before a 1.0 release.

* Social media integration (twitter cards, open graph, etc)
* Categories and Tags (Including index pages)
* Pagination on index pages
* Share buttons
* XML Feeds

Other features that may come after 1.0 include:

* Easy Google Analytics setup (just add your key to `_config.yml`)
* Media galleries (possibly using Bootstrap 4 carousel)
* Support for extra formatting including both dark & light code blocks, call-out
  sections (warning, danger, important...)
* Read more / related posts
