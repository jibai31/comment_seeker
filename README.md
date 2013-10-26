comment_seeker
==============

Endless thirst for comments!

== Getting Started

First add the gem to your Gemfile.

    gem 'comment_seeker'

Then call the `seek` method passing your query as argument.

    comment_seeker = CommentSeeker.new
    results = comment_seeker.seek("twitter pour entreprise")

You get a list of `Mechanize::Page` objects. You can access for instance:

    results.each do |page|
      page.forms    # All the form tags on the page
      page.images   # All the img tags on the page
      page.links    # All the links on the page
      page.links_with(:href => /some_pattern/)  # Special links on the page
      page.title
      page.uri
    end

Check here for the full list of available methods:
http://mechanize.rubyforge.org/Mechanize/Page.html
