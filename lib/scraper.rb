#require the libraries we need
require 'open-uri' #open the file on the internet
require 'nokogiri' #line10
require 'debugger'

class Scraper
	attr_reader :html

	def initialize(url)
		download = open(url) #method that opens the url with the gem open-uri and brings back the HTML (or whatever is at URL). Goes and gets it. Don't need to save it to instance of class.
		@html =	Nokogiri::HTML(download) #HTML method translate the file into HTML to be used in Ruby. Makes the TempFile useful. Returns it in nicer format. @html is now a nokogiri object
		#Make instance variables to store things for the class.
	end

	def get_name
		#not instance variable, method cuz of :html attr_reader
		#all_the_h3s = html.search("h3") #search returns back the tags and everything inside of it "a" all the <a>s. Return a a html object to all_the_h3s.
		#all_the_h3s.text #.text is a method that gives the content of the tag. Can be called on the special Nokogiri object. Returns a object of String. 
		
		all_the_h3s = @html.search("h3").to_s.gsub(" ", "*").gsub("</h3>", "<h3>").gsub("<h3>", " ").split
    	all_the_h3s.collect do |name|
      		name.gsub("*", " ")
    	end
	end

	def get_blog
		#href attribute <html element attributes (=)
		blog_url = html.search("ul.social a.blog")
		blog_url_array = []
		
		blog_url.each do |index|
			blog_url_array << index["href"]
		end
		blog_url_array

	end

	def get_twitter
		twitter_url = html.search("ul.social")
		twitter_url_array = []
		twitter_url.each do |twitter_almost|
			if twitter_almost.search(".twitter")[0].nil?
			 	twitter_url_array << "none"
			 else
				twitter_url_array << twitter_almost.search(".twitter")[0]["href"]
			end

			
		end

		all_the_twitters = twitter_url.text.gsub(/\s+/, " ").strip.scan(/@\w+\b/)
	end

end

#Test that you succesfully get stuff from the internet
my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

puts my_scraper.get_twitter.inspect

#My folder
# -> sub-folder

# My folder/sub-folder

# class
# -> class mathod
# -> constant

#class::class_method
#class::constant

#class = .intro
#id = #unique
#element = h3, div, etc.
