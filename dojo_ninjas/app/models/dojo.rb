class Dojo < ActiveRecord::Base
	has_many :ninjas
	validates :state, length: { is: 2}
end
