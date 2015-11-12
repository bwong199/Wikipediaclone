class AddFriendships < ActiveRecord::Migration
  def change
  	add_column :friendships, :friend, :string
  end
end
