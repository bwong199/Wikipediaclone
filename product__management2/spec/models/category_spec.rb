require 'rails_helper'

RSpec.describe Category, type: :model do
    it 'requires a name' do
    category = Category.new(name: '')
    category.valid?
    expect(category.errors[:name].any?).to eq(true)
  end
  describe 'relationships' do
    it 'has many products' do
    category = Category.create(name: 'Gardening')
    product1 = category.products.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    product2 = category.products.create(name: 'Boots', description: 'Not walking', pricing: 535.00)
    expect(category.products).to include(product1)
    expect(category.products).to include(product2)
    end
  end
end
