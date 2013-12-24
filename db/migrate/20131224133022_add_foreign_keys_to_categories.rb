class AddForeignKeysToCategories < ActiveRecord::Migration
  def up
    change_table :categories do |t|
      t.foreign_key :word_sets, dependent: :delete
      t.foreign_key :categories, column: 'parent_id', name: 'categories_parent_id_fk', dependent: :delete
    end
  end

  def down
    change_table :categories do |t|
      t.remove_foreign_key :word_sets
      t.remove_foreign_key name: 'categories_parent_id_fk'
    end
  end
end
