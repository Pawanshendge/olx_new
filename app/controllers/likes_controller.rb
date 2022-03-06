class LikesController < ApplicationController
  def show
  end
  
  def create
    #byebug
    @like = Like.create(like_params)
    if @like.save 
      flash[:notice] = "Like has saved"
		  redirect_to products_path
 	  end
  end
  
    def destroy
     @like = Like.find(params[:id])
     @like.destroy
     flash[:notice] = "like has destroyed"
     redirect_to products_path
  end

    private
    def like_params
      params.require(:like).permit(:likeable_id,:likeable_type,:user_id)
    end
end
