require './lib/student.rb'
require './lib/scraper.rb'


def launch_twitter(name, students)	
	students.each do |student|
		if name == student.name
			return student.twitter_url
		end
	end	
end

def launch_blog(name, students)
	students.each do |student|
		if name == student.name
			return student.blog_url
		end
	end	
end


my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")

names = my_scraper.get_names
blogs = my_scraper.get_blogs
twitters = my_scraper.get_twitters

students = []
28.times do |i|
	students << Student.new(names[i],blogs[i],twitters[i])
end

puts students[0].name


