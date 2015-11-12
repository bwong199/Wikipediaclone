class CommentsController < ApplicationController
	def create
	product = Product.find(params[:product_id])
	comment = product.comments.create(comment: params[:comment])
	redirect_to product_path(params[:product_id]) 
	# redirect_to '/products/#{product.id}'

    end

    def index
  	@comments = Comment.all
 	 end


  def destroy

	product = Product.find(params[:product_id])
	comment = Comment.find(params[:comment_id])
	comment.destroy
	redirect_to product_path(params[:product_id]) 
	# redirect_to '/products/#{product.id}'
  end 

end
