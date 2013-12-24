class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :word_set_id, null: false
      t.integer :parent_id
      t.string :name
      t.timestamps
    end
  end
end
