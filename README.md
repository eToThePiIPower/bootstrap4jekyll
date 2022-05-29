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
5.  Add your Google Analytics and Disqus keys to
    `site.services.   google-analytics` and `site.services.disqus`

### Using header images (in detail)

1.  Upload a site header to `/images/headers/`, and update the metadata in
    `site.header.*`. You can use the included `/bin/darken` script if you
    have imagemagick installed for some quick tweaking to make the image more
    easy to read text over. Supported keys for `site.header.*` are:
    * `image` The image filename, eg `my_photo.jpg
    * `imagealt` Alt text for the visually impaired
    * `title` A title to show on the image attribution block
    * `title-link` A link to a page for the image, eg on flickr
    * `credit` The person/company/entity to attribute the image to
    * `credit-link` A link for the image creator, eg to their flickr gallery
    * `license` One of the following list, This creates the appropriate
      copyright disclaimer for the image as described by Creative Commons.
      - `cc0` Public domain
      - `cc-by-2` Creative Commons Attribution 2.0
      - `cc-by-4` Creative Commons Attribution 4.0
      - `cc-by-sa-4` Creative Commons Attribution Share-Alike 4.0
      - `reserved` All rights reserved, used with permission
2.  Upload header images for individual categories, and configure their
    metadata in `site.categories_meta.<category>.header` as described above.
3.  Individual posts can also have their own header images, by adding a
    `post.header` to their front-matter.
4.  Index pages will show a
    header image for a post only if it is specifically set in the
    front-matter, while the related-posts and top banners will choose from
    the following order of precedence:
    * The header in the post's frontmatter
    * The header from the post's category
    * The default site header.

## Features

The following will likely be implemented before a 1.0 release.

- [ ] Social media integration (twitter cards, open graph, etc)
- [x] Categories and Tags (Including index pages)
- [x] Pagination on index pages
- [x] Social media sharing links
- [x] XML Feeds
- [x] Easy Google Analytics setup (just add your key to `_config.yml`)
- [ ] Media galleries (possibly using Bootstrap 4 carousel)
- [ ] Support for extra formatting including both dark & light code blocks, call-out
      sections (warning, danger, important...)
- [ ] Read more
- [x] Related posts
