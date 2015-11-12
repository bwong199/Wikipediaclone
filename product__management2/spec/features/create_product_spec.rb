require 'rails_helper'
RSpec.describe 'creating product' do
  it 'creates a new product and redirect to products page' do
    
  	Category.create(name:"Electronics")
    visit "/products/new"
    select "Electronics", :from => "Category"
    fill_in 'Name', with: 'Shoe'
    fill_in 'Pricing', with: '10.00'
    fill_in 'Description', with: 'Walking'
    click_button 'Create'
    expect(current_path).to eq('/products')
    expect(page).to have_text('Shoe')
  end
end