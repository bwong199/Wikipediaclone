require 'rails_helper'
RSpec.describe 'creating a comment for a product' do
  it 'creates a new comment and redirects to product show page' do
    
    product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good')
    visit '/products'
    click_button 'Show'
    fill_in 'Comment', with: 'good'
    click_button 'Submit'
    expect(current_path).to eq('/products/#{product.id}')
    expect(page).to have_text('good')
  end
end