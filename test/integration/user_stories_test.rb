require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
fixtures :products

test "buying an item" do
	LineItem.delete_all
	Order.delete_all
	given_item = products(:ruby)

	get "/"
	assert_response :success
	assert_template "index"

	xml_http_request :post, '/line_items', product_id: given_item.id
	assert_response :success

	cart = Cart.find(session[:cart_id])
	assert_equal 1, cart.line_items.size
	assert_equal given_item, cart.line_items[0].product

	get "/orders/new"
	assert_response :success
	assert_template "new" 

	post_via_redirect "/orders"
					   order: {name: "Brandon Caiza",
					   		   address: "123 Main Street",
					   		   email: "brandon@example.com",
					   		   pay_type: "Check"}
	assert_response :success
	assert_template "index"
	cart = Cart.find(session[:cart_id])
	assert_equal 0, cart.line_items.size

	orders = Order.all
	assert_equal 1, orders.size
	order = orders[0]

	assert_equal "Brandon Caiza", order.name
	assert_equal "123 Main Street", order.address
	assert_equal "brandon@example.com", order.email
	assert_equal "Check", order.pay_type

	assert_equal 1, order.line_items.size
	line_items = order.line_items[0]
	assert_equal given_item, line_item.product

	mail = ActionMailer::Base.deliveries.last
	assert_equal ["brandon@example.com"], mail.to
	assert_equal 'Brandon Caiza <complexzity@example.com>', mail[:from].value
	assert_equal "'Item bought confirmation'", mail.subjectcf
  end
end
