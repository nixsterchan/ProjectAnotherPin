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

    @order_item = OrderItem.find(params[:id])

    #update with the form params
    @order_item.update(form_params)

    flash[:success] = "Thanks for updating your cart"

    redirect_to product_path(@product)


  end

  def destroy
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.find(params[:id])

    # delete completely
    @order_item.delete

    flash[:success] = "Product removed from cart"

    redirect_to cart_path
  end

  def form_params
    params.require(:order_item).permit(:quantity)

  end
end
