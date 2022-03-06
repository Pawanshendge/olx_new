class CommentsController < ApplicationController
  def show
  end
  
  def create
  	#byebug
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    flash[:notice] = "Comment has saved"
    redirect_to product_path(@product)
  end
  def destroy
    @product = Product.find params[:product_id]
    @comment = @product.comments.find(params[:id])
    @comment.destroyflash[:notice] = "Comment has destroyed"
    redirect_to product_path(@product)
  end


  private
    def comment_params
      params.require(:comment).permit(:body, :user_id )
    end
end
