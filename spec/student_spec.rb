require_relative '../lib/student'

describe Student, "#name" do
	test_student = Student.new("Keef","coderulez.com","KDizzle")

	it "should respond to name method" do
		#should test_student respond_to(:name)
		expect(test_student.name).to eq("Keef")
	end
end

