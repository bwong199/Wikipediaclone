require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'relationships' do
    it 'belongs to a category' do
    category = Category.create(name: 'Gardening')
    product = category.products.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    expect(product.category).to eq(category)
    end
  end


    it 'requires a name' do
    product = Product.new(name: '')
    product.valid?
    expect(product.errors[:name].any?).to eq(true)
  end

  it 'requires a pricing' do
    product = Product.new(pricing: '')
    product.valid?
    expect(product.errors[:pricing].any?).to eq(true)
  end

  it 'requires a description to be at least 7 characters' do
    product1 = Product.new(description: "ABCDEFG")
    product2= Product.new(description: "ABCDEF")

    [product1, product2].each { |u| u.valid? }

    expect(product1.errors[:description].any?).to eq(false)
    expect(product2.errors[:description].any?).to eq(true)
  end
end
