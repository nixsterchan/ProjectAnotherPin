class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # sets it up on every single part of our website
  before_action :current_cart

  # lets us put it into views 
  helper_method :current_cart

  def current_cart
    # if customer just arrived on the site, give brand new cart
    # if a cart already exists for them, keep it there
    # check session[:cart_id]

    if session[:cart_id].present?
      # already have a cart 
      @current_cart = Cart.find(session[:cart_id])
    else
      # do not have a cart
      @current_cart = Cart.create
      # creates the cart for every page
      session[:cart_id] = @current_cart.id 
    end
  end
end
