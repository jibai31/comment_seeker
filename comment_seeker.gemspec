Gem::Specification.new do |s|
  s.name        = 'comment_seeker'
  s.version     = '0.0.1'
  s.summary     = "Find pages where you can add comments"
  s.description = "A simple gem to query a keyword and retrieve pages on which you could add comments."
  s.authors     = ["Jean-Baptiste Goulain"]
  s.email       = 'jibai31@gmail.com'
  s.homepage    = 'https://github.com/jibai31/comment_seeker'

  s.files        = ["lib/comment_seeker.rb", "lib/comment_seeker/comment_search.rb"]
  s.require_path = "lib"

  s.add_development_dependency 'mechanize', '~> 2.7'
end
