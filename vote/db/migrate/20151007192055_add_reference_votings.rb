class AddReferenceVotings < ActiveRecord::Migration
  def change
  	add_reference(:languages, :voting, index:true)
  	add_foreign_key :languages, :votings
  end
end
