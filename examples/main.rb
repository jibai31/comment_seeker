require 'rubygems'
require_relative '../lib/comment_seeker'

comment_seeker = CommentSeeker.new
results = comment_seeker.seek("twitter pour entreprise")
results.each do |page|
  p page.title
  p page.uri
end
