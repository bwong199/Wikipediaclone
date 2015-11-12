class Product < ActiveRecord::Base
	validates :name, :pricing, presence: true
	validates :description,  length: { minimum: 7 }
	belongs_to :category
	has_many :comments

end
