class OrderItemsController < ApplicationController

  def create
    # find the product
    @product = Product.find(params[:product_id])

    # quantity? comes from the form data
    @quantity = form_params[:quantity]

    # add to cart 
    @current_cart.order_items.create(product: @product, quantity: @quantity)

    flash[:success] = "Thanks for adding to cart"

    redirect_to product_path(@product)

  end

  def update
    @product = Product.find(params[:product_id])

    flash[:success] = "Thanks for updating your cart"

    redirect_to product_path(@product)


  end

  def form_params
    params.require(:order_item).permit(:quantity)

  end
end
