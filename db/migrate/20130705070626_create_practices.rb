class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.integer :user_id
      t.integer :craft_id

      t.timestamps
    end
    add_index :practices, [:user_id]
    add_index :practices, [:craft_id]
  end
end
