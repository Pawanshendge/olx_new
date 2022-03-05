class CartsController < ApplicationController
  def add_to_cart
        product = Product.find(params[:product_id])
        cart = current_user.cart
        shops = cart.shops
        item = shops.find_by(product_id: product.id)
        if item
  	      item.save
        else
  	      shops.create(product_id: product.id)
        end
    redirect_to root_path
  end
end
