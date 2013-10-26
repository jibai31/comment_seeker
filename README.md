comment_seeker
==============

Endless thirst for comments!

== Getting Started

First add the gem to your Gemfile.

    gem 'comment_seeker'

Then call the `seek` method passing your query as argument.

   comment_seeker = CommentSeeker.new
   results = comment_seeker.seek("twitter pour entreprise")

You get a list of `Mechanize::Page` objects.
