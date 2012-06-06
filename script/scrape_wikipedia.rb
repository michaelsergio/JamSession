require 'nokogiri'
require 'open-uri'

wikipedia = %w{
  http://en.wikipedia.org/wiki/List_of_styles_of_music:_A-F
  http://en.wikipedia.org/wiki/List_of_styles_of_music:_G-M
  http://en.wikipedia.org/wiki/List_of_styles_of_music:_N-R
  http://en.wikipedia.org/wiki/List_of_styles_of_music:_S-Z
}

wikipedia.each do |url|
  doc = Nokogiri::HTML(open(url))
  doc.css('a').each do |link|
    puts link.content
  end
end
