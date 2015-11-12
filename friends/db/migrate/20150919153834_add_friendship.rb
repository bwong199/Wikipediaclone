class AddFriendship < ActiveRecord::Migration
  def change
  	add_reference :friendships, :friend, index:true
  	add_reference :users, :friendship,  index:true
  end
end
