class AddNewJointoEvents < ActiveRecord::Migration
  def change
  	add_column :users, :event_join, :boolean
  	add_reference :users, :event, index:true
  end
end
