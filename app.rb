require './lib/student.rb'
require './lib/scraper.rb'
require 'launchy'

def launch_page(student_name, page_type, students_array)
 	students_array.each do |student|
 		url = page_type == "blog" ? student.blog_url : student.twitter_url
		if student_name == student.name 
			if url == "none"
				puts "Sorry no #{page_type} to launch for #{student_name} =("
				return
			else
				puts "Launching #{student_name}'s #{page_type} at #{url}"
				5.times do
					print "."
					sleep(0.5)
				end
				puts "Here we GO! Prepare to be amazed!"
				sleep(1) #Dramatic pause
				Launchy.open(url)
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
		launch_page(student_name, "blog", students_array)
	elsif launch_choice == "t"
		launch_page(student_name, "twitter", students_array)
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

#--------------------------^Blueprint^----------------------

my_scraper = Scraper.new("http://flatironschool-bk.herokuapp.com/")
names = my_scraper.get_names
blogs = my_scraper.get_blogs
twitters = my_scraper.get_twitters
students_array = create_students(names, blogs, twitters)

play(students_array,names)

puts "Thanks for playing!"