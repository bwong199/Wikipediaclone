require 'rails_helper'
RSpec.describe 'listing comments' do
  it 'displays list of all comments' do
   	product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good')
    visit '/comments'
    expect(page).to have_text('good')
  end
  it 'lists comments related to particular product in product show page' do
    product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good')
    visit '/products'
    click_button 'Show'
    expect(current_path).to eq("/products/#{product.id}")
    expect(page).to have_text('good')
  end
end
