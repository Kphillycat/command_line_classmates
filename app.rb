require './lib/student.rb'
require './lib/scraper.rb'
require 'launchy'


def launch_twitter(name, students)	
	students.each do |student|
		if name == student.name
			puts "Launching #{student.twitter_url}"
			5.times do
				print "."
				sleep(0.5)
			end
			puts "Here we GO!"
			sleep(0.5)
			Launchy.open(student.twitter_url)
		end
	end	
end

def launch_blog(name, students)
	students.each do |student|
		if name == student.name
			puts "Launching #{student.blog_url}"
			5.times do
				print "."
				sleep(0.5)
			end
			puts "Here we GO!"
			sleep(0.5)
			Launchy.open(student.blog_url)
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

puts "Students name (r for random)?"
student_name = gets.chomp
if student_name == "r"
	student_name = names.sample
end
launch_blog(student_name, students)


