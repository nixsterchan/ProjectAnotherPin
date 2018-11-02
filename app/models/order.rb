class Order < ApplicationRecord
  has_many :order_items

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :country, presence: true
  
  # give the ability to allow other items to go into orders
  # allow anything for the order items to go in
  accepts_nested_attributes_for :order_items

  def add_from_cart(cart)
    # loop ever the cart we are passing through, with all the order items, and add those order items into our order
    cart.order_items.all.each do |item|
      # self refers to this individual order
      self.order_items.new(product: item.product, quantity: item.quantity ) # find the item in cart and add it to the order itself
    end

  end

  def save_and_charge

    # check our data is valid
    # if it is, charge in stripe
    # if it isnt, return false
    # charge in stripe and save if all is good

    if self.valid?
      Stripe::Charge.create(amount: self.total_price, currency: "usd", source: self.stripe_token, description: "Order for " + self.email)
      self.save
    else
      # does not pass validations
      false
      
    end
    
      # e is just a variable
  rescue Stripe::CardError => e
    # this is from stripe
    @message = e.json_body[:error][:message]
  
    # add it to model errors
    self.errors.add(:stripe_token, @message)
  
    # return false on controller
    false
  
  end

  def total_price
    @total = 0

    order_items.each do |item|
      @total = @total + item.product.price * item.quantity
    end


    @total
  end

  def total_price_in_dollars
    @total = 0

    order_items.all.each do |item|
      @total = @total + item.product.price_in_dollars * item.quantity
    end

    @total
  end

end

