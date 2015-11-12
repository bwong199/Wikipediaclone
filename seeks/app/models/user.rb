class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true,  :confirmation => true
  validates :email, format: { with: EMAIL_REGEX }, presence: true, uniqueness: { case_sensitive: false }, :on => :create
  validates :password, presence: true, confirmation: true, :on => :create
  
  has_secure_password
  
  has_many :secrets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
end
