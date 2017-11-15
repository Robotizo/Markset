require 'test_helper'

class OrderNotifierMailerTest < ActionMailer::TestCase
  test "confirmed" do
    mail = OrderNotifierMailer.confirmed
    assert_equal "Confirmed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
