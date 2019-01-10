# Same requirements as in lecture notes
require "nokogiri"
require "open-uri"
require "pp"

doc = Nokogiri::HTML(open("https://www.dogstrust.ie/rehoming/"))

# Looking at the images on the webpage 

images = doc.xpath("//img")
img_count = images.length

puts "There are #{img_count} images on this web page."
puts "These images are: "

imgs = images.search("img")
	if imgs.any?
		then imgs.each {|image| puts "There is an image called #{image[:src]}"}
	end 

puts "***************"

# Looking at the paragraphs on the webpage 

paragraphs = doc.xpath('//p')
para_count = paragraphs.length
first = paragraphs.first
last = paragraphs.last
first_content = first.inner_text
last_content = last.inner_text


puts "There are #{para_count} paragraphs in this web page."
puts "The content of the first paragraph is:  "
puts first_content
puts "=================="
puts "The content of the last paragraphs is:  "
puts last_content 

puts "***************"

# Looking at the links on the web page 

links = doc.xpath("//a[@href]")
link_count =  links.length
link_twenty = links[20]["href"]

puts "There are #{link_count} links on this web page"
puts "The 20th link on this webpage is #{link_twenty} "