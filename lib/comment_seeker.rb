require 'mechanize'

class CommentSeeker

  def initialize
    @comment_search_pattern = CommentSearch.new.pattern  
  end

  def seek(query)
    commentable_pages = []

    # Create a new instance of Mechanize and grab our page
    uri = "https://www.google.fr/search?q=" + CGI.escape(query)
    agent = Mechanize.new
    agent.get(uri) do |result_page|
      result_links(result_page).each do |link|
        page = link.click
        commentable_pages << page if is_commentable?(page)
      end
    end
    commentable_pages
  end
  
  private

  attr_reader :comment_search_pattern

  def result_links(result_page)
    result_page.links.find_all { |l| l.attributes.parent.name == 'h3' }
  end

  def is_commentable?(page)
    content = page.parser
    content.at('body').text =~ comment_search_pattern
  end

end

require_relative 'comment_seeker/comment_search'
