class Friendship < ActiveRecord::Base
  has_many :friendships, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships

  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :friend, foreign_key: "friend_id", class_name: "User" 
end
