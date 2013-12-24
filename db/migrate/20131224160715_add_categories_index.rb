class AddCategoriesIndex < ActiveRecord::Migration
  def up
    add_index :categories, [:parent_id, :word_set_id]
  end

  def down
    remove_index :categories, [:parent_id, :word_set_id]
  end
end

