class Event < ActiveRecord::Base
	has_many :users
	has_many :comments
	belongs_to :user
	validates :location, :name, :description, presence: true



end
