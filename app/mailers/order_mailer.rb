class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.receipt.subject
  #
  # when placing an order, i want to make a new receipt in my ordermailer, but i need to know which order im talking about 
  def receipt(order)
    # to allow us to use @order in our views
    @order = order 

    mail to: @order.email, subject: "Thank you for ordering from Another Pin Co"
  end
end
