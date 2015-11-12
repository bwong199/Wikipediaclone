require 'rails_helper'
RSpec.describe 'updating product' do
  it 'updates product and redirects to products page' do
    Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    visit '/products'
    click_button 'Edit'
    fill_in 'Name', with: 'Boots'
    click_button 'Update'
    expect(current_path).to eq('/products')
    expect(page).to have_text('Boots')
  end
end