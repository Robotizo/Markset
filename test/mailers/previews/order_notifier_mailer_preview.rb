# Preview all emails at http://localhost:3000/rails/mailers/order_notifier_mailer
class OrderNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier_mailer/confirmed
  def confirmed
    OrderNotifierMailer.confirmed(Order.first, User.first)
  end

  def producerConfirmed
    OrderNotifierMailer.producerConfirmed(Order.second, Page.first, User.first)
  end

end
