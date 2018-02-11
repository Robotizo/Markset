class OrderNotifierMailer < ApplicationMailer
  default from: " Markset Order <marksetorder@markset.com>"

  def confirmed(order, user)
  	@order = order
    @user = user

    mail(to: @order.user.email, subject: 'Your Order')
  end

  def producerConfirmed(order, page, user)
  	@order = order
    @page = page
    @user = user

    mail(to: @page.user.email, subject: 'New Order')
  end

end
