class ShopsController < ApplicationController
	def index
	    @shops = Shop.all
	end

  def show
      @shop = current_shop
     
  end

 	def destroy
	    @shop = Shop.find(params[:id])
	    @shop.destroy
	    redirect_to @shop
  end

	
  private

	def shop_params
		params.require(:shop).permit( :product_id)
	end
end
