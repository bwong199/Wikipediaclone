class AddReference < ActiveRecord::Migration
  def change
  	add_reference :languages, :voting, index:true
  end
end
