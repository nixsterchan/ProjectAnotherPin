class Cart < ApplicationRecord
  has_many :order_items

  def total_quantity
    # go over each order item and add up
    @count = 0

    # next, loop over each thing in the order item and add quantity to the count
    order_items.all.each do |item|
      # find the count and add one to it
      @count = @count + item.quantity
    end

    @count
  end


  def total_price
    @total = 0

    order_items.all.each do |item|
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
