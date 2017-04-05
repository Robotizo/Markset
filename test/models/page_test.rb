require 'test_helper'

class PageTest < ActiveSupport::TestCase
	test "page attributes mut not be empty" do
	product = Product.new
	assert page.invalid?
	assert page.errors[:title].any?
	assert page.errors[:description].any?
	assert page.errors[:genre].any?
	assert page.errors[:image_url].any?
	end
end
