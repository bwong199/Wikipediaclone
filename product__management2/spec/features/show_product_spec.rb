require 'rails_helper'
RSpec.describe 'product details page' do
  it 'displays information about product' do
     product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    visit '/products'
    click_button 'Show'
    expect(current_path).to eq("/products/#{product.id}")
    expect(page).to have_text('Shoe')
    expect(page).to have_text('Walking')
    expect(page).to have_text('10.00')
  end
end