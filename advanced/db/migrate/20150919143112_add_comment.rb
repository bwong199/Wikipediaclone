class AddComment < ActiveRecord::Migration
  def change

  	add_reference :blogs, :comment,  index:true
  	add_reference :messages, :comment,  index:true
  	add_reference :posts, :comment,  index:true
  	add_reference :users, :comment,  index:true
  end
end
