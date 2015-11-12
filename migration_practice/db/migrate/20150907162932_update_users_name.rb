class UpdateUsersName < ActiveRecord::Migration
  def change
  	rename_table :contents, :Users
  end
end
