require 'test_helper'

class OrderNotifierMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifierMailer.received(orders(:one))
    assert_equal "Complexzity Item Bought", mail.subject
    assert_equal ["brandon@example.org"], mail.to
    assert_equal ["markset@example.com"], mail.from
    assert_match /1 x Bird /, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifierMailer.shipped(orders(:one))
    assert_equal "Complexzity Item Shipped", mail.subject
    assert_equal ["brandon@example.org"], mail.to
    assert_equal ["markset@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Bird<\/td>/, mail.body.encoded
  end

end
