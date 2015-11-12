class User < ActiveRecord::Base
	validates :email_address, presence: true
	validates :first_name, :last_name, presence: true, length: { minimum: 2 }
	validates :age, presence: true, numericality: { only_integer: true }, length: {minimum: 10,
    maximum: 150 }
end
