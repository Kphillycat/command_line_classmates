# using your student.rb and scraper.rb, write a command line app that gives the user the opportunity to:
#  - launches a given student's twitter
#  - launches a given student's blog
#  - launches a random student's twitter
#  - launches a random student's blog

require_relative '../app.rb'
require_relative '../lib/student.rb'

describe "#launch_twitter" do
	test_students = []
	test_students << Student.new("Keith","KDizzle","Kphillycat")
	#Initial tests just for return values, won't work with launchy
	it "should return a given student's twitter" do
		expect(launch_twitter("Keith", test_students)).to eq("Kphillycat")
	end
end

describe "#launch_blog" do
	test_students = []
	test_students << Student.new("Keith","KDizzle","Kphillycat")
	#Initial tests just for return values, won't work with launchy
	it "should return a given student's blog" do
		expect(launch_blog("Keith", test_students)).to eq("KDizzle")
	end
end