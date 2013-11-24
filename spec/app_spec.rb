# using your student.rb and scraper.rb, write a command line app that gives the user the opportunity to:
#  - launches a given student's twitter
#  - launches a given student's blog
#  - launches a random student's twitter
#  - launches a random student's blog

require_relative '../app.rb'
require_relative '../lib/student.rb'

describe "#create_students" do
	test_names_array = []
	test_blogs_array = []
	test_twitters_array = []

	5.times do |x| 
	 	test_names_array << "Name#{x}"
	 	test_twitters_array << "Twitter#{x}"
	 	test_blogs_array << "Blog#{x}"
	end

 	it "should create an array of students, with name of at index 1" do
		expect(create_students(test_names_array, test_blogs_array, test_twitters_array)[1].name).to eq("Name1")
	end

	it "should create an array of students, with blog_url of at index 1" do
		expect(create_students(test_names_array, test_blogs_array, test_twitters_array)[1].blog_url).to eq("Blog1")
	end

	it "should create an array of students, with twitter_url of at index 1" do
		expect(create_students(test_names_array, test_blogs_array, test_twitters_array)[1].twitter_url).to eq("Twitter1")
	end
end

# describe "#get_user_input(students_array, names)" do
# end

# describe "#play(students_array, names)" do
# end

# describe "#launch_page" do
# 	test_students = []
# 	test_students << Student.new("Keith","KDizzle","Kphillycat")
# 	#Initial tests just for return values, won't work with launchy
# 	it "should open a given student's twitter" do
# 		expect(launch_page("Keith", test_students)).to eq("Kphillycat")
# 	end

# 	#Initial tests just for return values, won't work with launchy
# 	it "should open a given student's blog" do
# 		expect(launch_page("Keith", test_students)).to eq("KDizzle")
# 	end
# end