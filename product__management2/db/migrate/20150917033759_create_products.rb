class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :pricing
      t.reference :category, index: true
      t.timestamps null: false
    end
  end
end
