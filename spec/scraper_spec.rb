require_relative '../lib/scraper'

describe Scraper, "#html" do
	test_scraper = Scraper.new("http://www.example.com")

	it "should return with value of html" do
		expect(test_scraper.html).to be_a(Nokogiri::HTML::Document)
	end
end