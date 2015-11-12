require 'rails_helper'
RSpec.describe Comment, type: :model do
  it 'requires a comment' do
  	product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.new(comment: '')
    comment.valid?
    expect(comment.errors[:comment].any?).to eq(true)
  end
  
  describe 'relationships' do
    it 'belongs to a product' do
    product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good product')
    
    expect(comment.product).to eq(product)
    end
  end
end