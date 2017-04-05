class OrderNotifierMailer < ActionMailer::Base
  default from: 'Brandon Caiza <complexzity@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #
  def received(order)
    @greeting = "Hi"
    @order = order

    mail to: order.email, subject: 'Item bought confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #
  def shipped(order)
    @greeting = "Hi"
    @order = order

    mail to: order.email, subject: 'Item delivered confirmation'
  end
end
