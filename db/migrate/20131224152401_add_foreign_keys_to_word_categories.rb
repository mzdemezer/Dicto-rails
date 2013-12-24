class AddForeignKeysToWordCategories < ActiveRecord::Migration
  def up
    change_table :word_categories do |t|
      t.foreign_key :words, dependent: :delete
      t.foreign_key :categories, dependent: :delete
    end
  end

  def down
    change_table :word_categories do |t|
      t.remove_foreign_key :words
      t.remove_foreign_key :categories
    end
  end
end
