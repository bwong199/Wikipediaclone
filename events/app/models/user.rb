class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  belongs_to :event 
  has_many :events
  validates :first_name, :last_name, :location, presence: true
  validates :email, format: { with: EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, presence: true, length: { minimum: 8 }, confirmation: true, :on => :create
end
