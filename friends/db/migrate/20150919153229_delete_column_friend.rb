class DeleteColumnFriend < ActiveRecord::Migration
  def change
  	remove_column :friendships, :friend, :string
  end
end
