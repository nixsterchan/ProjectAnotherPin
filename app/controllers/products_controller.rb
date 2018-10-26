class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  # params is anything pseudo form or url
  def show
    @product = Product.find(params[:id])
  end
end
