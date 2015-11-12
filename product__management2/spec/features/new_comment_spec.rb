require 'rails_helper'
RSpec.describe 'new comment' do
  it 'displays correct fields to create new comment for a particular product' do
    product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good')
    visit '/products'
    click_button 'Show'
    expect(current_path).to eq("/products/#{product.id}")
    expect(page).to have_field('Comment')
  end
end