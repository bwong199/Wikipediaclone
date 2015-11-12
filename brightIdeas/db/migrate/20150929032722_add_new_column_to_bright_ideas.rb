class AddNewColumnToBrightIdeas < ActiveRecord::Migration
  def change
  	add_column :bright_ideas, :idea_author, :string
  end
end
