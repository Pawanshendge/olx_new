class ProductsController < ApplicationController
def index
		@products = Product.all
	end

	def show
        @product = Product.find(params[:id])
    end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)
		if @product.save
			redirect_to @product
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@product = current_user.products.find(params[:id])
	end

	def update
		@product = current_user.products.find(params[:id])
		if @product.update(product_params)
			redirect_to @product
		else
			render :edit, status: :unprocessable_entity
		end
	end 

	def destroy
	    @product = current_user.products.find(params[:id])
	    @product = current_user.products.find(params[:id])
	    @product.destroy
	    redirect_to root_path, status: :see_other
    end
    def search
		@query = params[:query]
		@products = Product.where("products.name like ?", ["%#{@query}%"])
		render :index
	end

	private

	def product_params
		params.require(:product).permit(:name, :price, :description, :image )
	end
end
