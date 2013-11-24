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

	def get_names
  		all_the_h3s = html.search("h3")
  		all_the_h3s.collect do |h3|
  			h3.text
  		end
	end

	def get_blogs
		the_students = html.search(".student")
		
		the_students.collect do |student|
			student.search(".blog").empty? ? "none" : student.search(".blog")[0]["href"]
		end
	end

	def get_twitters
		the_students = html.search(".student")
		
		the_students.collect do |student|
			student.search(".twitter").empty? ? "none" : student.search(".twitter")[0]["href"]
		end
	end

	# 	all_the_twitters = twitter_url.text.gsub(/\s+/, " ").strip.scan(/@\w+\b/)

end

#Test that you succesfully get stuff from the internet
# my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
# puts my_scraper.get_twitters.inspect

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
