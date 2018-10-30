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


end

