require 'rails_helper'
RSpec.describe 'deleting a product' do
  it 'deletes product and redirects to products page' do
    Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    visit '/products'
    expect(page).to have_text('Shoe')
    click_button 'Destroy'
    expect(page).to_not have_text('Shoe')
  end
end