class ProductsController < ApplicationController
  def new
  	@categories = Category.all
  end

   	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to "/products"
	end

  def index
  	@products = Product.all

  end

    def edit
    	@categories = Category.all
	@product = Product.find(params[:id])

	end 


	def show
		@product = Product.find(params[:id])
		@comments = @product.comments.all
	end

	def create
	@category = Category.find(params[:category])
	puts params
	@product = @category.products.create(product_params)
	redirect_to '/products'
    end

	def update
	  @product = Product.find(params[:id])
	  @product.update(product_params)
	  redirect_to '/products'
	end

	private 
  		def product_params
  		params.require(:products).permit(:name, :description, :pricing)
 	end



end
