class UsersNewColumnFriends < ActiveRecord::Migration
  def change
  	add_column :Users, :friends, :string
  end
end
