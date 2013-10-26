require 'mechanize'

class CommentSeeker

  def seek(query)
    commentable_pages = []
    # Create a new instance of Mechanize and grab our page
    uri = "https://www.google.fr/search?q=" + CGI.escape(query)
    agent = Mechanize.new
    agent.get(uri) do |result_page|
      # Find all the links on the page
      result_links = result_page.links.find_all { |l| l.attributes.parent.name == 'h3' }
  
      result_links.each do |link|
        page = link.click
        commentable_pages << page if is_commentable?(page)
      end
    end
    commentable_pages
  end
  
  def comment_search_pattern
    patterns = [
      "Laisser un commentaire",
      "Ecrire un commentaire",
      "Post Comment"
    ]
    Regexp.union(patterns)
  end
  
  def is_commentable?(page)
    content = page.parser
    content.at('body').text =~ comment_search_pattern
  end
end
