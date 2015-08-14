---
title: 'A dumb markdown website'
css: 'https://maxcdn.bootstrapcdn.com/bootswatch/3.3.5/cerulean/bootstrap.min.css'
content-class: 'well'
---

This is just a little hack I stumbled across to throw together a blindly simple set of nicely formatted HTML pages on a server quickly and easily.

## How it works

Apache's [`mod_ext_filter`](https://httpd.apache.org/docs/2.2/mod/mod_ext_filter.html) allows you to pass the content of files on your filesystem through arbitrary binaries - this just sets that up to run the great [`pandoc`](http://pandoc.org/) utility on markdown files.

## Hard requirements

 - Pandoc installed to `/usr/bin/pandoc`

## Soft requirements

<div class="alert alert-info">Required for the install script to work - but it's incredibly simple to set it up manually yourself without these</div>

 - I've only tested `install.sh` on Debian-based systems sofar
 - Apache setup with the `a2enmod` and `a2enconf` utilities available

## Usage

Run `install.sh` (or read it and apply manually) and then pop the following into your `.htaccess` or *vhost* file:

```
<IfModule mod_ext_filter.c>
    AddOutputFilter pandoc md
</IfModule>
```

or alternatively, this (if you have no non-markdown files and don't want file-extensions):
```
<IfModule mod_ext_filter.c>
    SetOutputFilter pandoc
</IfModule>
```

## Markdown support

See [Pandoc](http://pandoc.org)'s docs for it's Markdown support.

The template also supports various variables in a **YAML** block (as seen at the top of this `README.md` file) - you can get a full overview of the variables supported by reading the `pandoc-template.html` file.

## Other thoughts

There's no caching - running `pandoc` on every page request is probably a terrible idea.
