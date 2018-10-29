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
end
