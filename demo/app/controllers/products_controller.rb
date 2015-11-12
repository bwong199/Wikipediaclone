class ProductsController < ApplicationController
  def index
  @products = Product.all
	end

def create
  @product = Product.create( product_params )
    puts @product
  render text: 'created a new product'
  redirect_to '/products/index'
end
def update
  @product = Product.update( product_params )
  redirect_to '/products/'
end
private 
  def product_params
   params.require(:product).permit(:name, :description)
  end



end
