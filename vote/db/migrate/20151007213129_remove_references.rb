class RemoveReferences < ActiveRecord::Migration
  def change
  	remove_reference :languages, :voting, index:true

  end
end
