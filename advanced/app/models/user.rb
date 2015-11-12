class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :first_name, :last_name, presence: true
	has_many :posts 
	has_many :messages 
	has_many :comments, as: :commentable
	has_many :owners
	has_many :blogs, through: :owners 
end
