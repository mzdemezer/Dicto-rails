class AddWordCategoriesIndex < ActiveRecord::Migration
  def up
    add_index :word_categories, [:category_id, :word_id], unique: true
  end

  def down
    remove_index :word_categories, [:category_id, :word_id]
  end
end
