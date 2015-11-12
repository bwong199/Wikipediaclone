require 'rails_helper'
RSpec.describe 'deleting a comment' do
  it 'deletes comment and redirects to product show page' do 
  	product = Product.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment: 'good')
    visit "/products/#{product.id}"
    click_button 'Destroy'
    expect(page).to_not have_text('good')
  end
end