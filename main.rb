require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'cgi'

def main(query)
  uri = "https://www.google.com/search?q=" + CGI.escape(query)
  doc = Nokogiri::HTML(open(uri))
  puts doc.at_css("title").text
  doc.css("h3.r a").each do |link|
    link_href = extract_page_url(link[:href])
    puts link_href
    result_doc = Nokogiri::HTML(open(link_href))
    puts result_doc.at_css("title").text
  end
end

def extract_page_url(google_result_link)
  start_index = google_result_link.index("http")
  end_index = [google_result_link.index("&ei"), google_result_link.index("&sa=")].min
  google_result_link[start_index..end_index-1]
end

main("nokogiri")
