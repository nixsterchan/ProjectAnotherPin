class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  # params is anything pseudo form or url
  def show
    @product = Product.find(params[:id])

    # if the product is already in the cart
    @order_item = @current_cart.order_items.find_by(product: @product)

    if @order_item.nil?
      # if it doesnt exist in the cart, we make one
      @order_item = @current_cart.order_items.new(product: @product, quantity: 1)

    end

  end
end
