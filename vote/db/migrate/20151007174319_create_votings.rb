class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
