require './lib/student.rb'
require './lib/scraper.rb'
require 'launchy'


def launch_twitter(name, students)	
	students.each do |student|
		if name == student.name
			if student.twitter_url == "none"
				puts "Sorry no twitter to launch for #{name} =("
				return
			else
				puts "Launching #{name}'s twitter at #{student.twitter_url}"
				5.times do
					print "."
					sleep(0.5)
				end
				puts "Here we GO! Prepare to be amazed!"
				sleep(0.5)
				Launchy.open(student.twitter_url)
			end
		end
	end	
end

def launch_blog(name, students)
	students.each do |student|
		if name == student.name
			if student.blog_url == "none"
				puts "Sorry no blog to launch for #{name} =("
				return
			else
				puts "Launching #{name}'s blog at #{student.blog_url}"
				5.times do
					print "."
					sleep(0.5)
				end
				puts "Here we GO! Prepare to be amazed!"
				sleep(1)
				Launchy.open(student.blog_url)
			end
		end
	end	
end

def get_user_input(students_array, names)
	puts "Which students's web page would you like to explore? (r for random)?"
	student_name = gets.chomp

	if student_name == "r"
		student_name = names.sample
		puts "Awesome! You're in luck #{student_name} was chosen at random just for you!"
	end
	
	puts "Would you like to open the b(log or t(witter page for #{student_name}?"
	launch_choice = gets.chomp.downcase

	if launch_choice == "b"
		launch_blog(student_name, students_array)
	elsif launch_choice == "t"
		launch_twitter(student_name, students_array)
	end

end

def create_students(names, blogs, twitters)
	students = []
	28.times do |i|
		students << Student.new(names[i],blogs[i],twitters[i])
	end
	students
end

def play(students_array, names)
	begin 
		get_user_input(students_array, names)
		puts "Wanna give it another go? (y/n)"
		ans = gets.chomp.downcase
	end while ans == "y"
end

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
names = my_scraper.get_names
blogs = my_scraper.get_blogs
twitters = my_scraper.get_twitters
students_array = create_students(names, blogs, twitters)

play(students_array,names)

puts "Thanks for playing!"