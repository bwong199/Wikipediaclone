class AddNameToCategory < ActiveRecord::Migration
  def change
  	rename_column :categories, :name, :name

  end
end
