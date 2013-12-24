class CreateWordCategories < ActiveRecord::Migration
  def change
    create_table :word_categories do |t|
      t.integer :word_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
