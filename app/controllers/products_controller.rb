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
			flash[:notice] = "product has saved"
			redirect_to @product
		else
			flash[:error] = "product has not saved"
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@product = current_user.products.find(params[:id])
	end

	def update
		@product = current_user.products.find(params[:id])
		if @product.update(product_params)
			flash[:notice] = "product has updated"
			redirect_to @product
		else
			flash[:error] = "try again to update"
			render :edit, status: :unprocessable_entity
		end
	end 

	def destroy
	    @product = current_user.products.find(params[:id])
	    @product.destroy
        flash[:notice] = "product has destroyed"
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
