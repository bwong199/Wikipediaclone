class AddForeignKey < ActiveRecord::Migration
  def change
  	add_foreign_key :likes, :users
  	add_foreign_key :likes, :bright_ideas
  	add_foreign_key :bright_ideas, :users
  end
end
