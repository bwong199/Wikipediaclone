class Dojo < ActiveRecord::Base
	has_many :ninjas, dependent: :destroy
	validates :name, :city, presence: true
	validates :state,  length: { minimum: 2 }
end
