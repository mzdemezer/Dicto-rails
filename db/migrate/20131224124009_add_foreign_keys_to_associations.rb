class AddForeignKeysToAssociations < ActiveRecord::Migration
  def up
    change_table :associations do |t|
      t.foreign_key :association_types, dependent: :delete
      t.foreign_key :words, column: 'first_word_id', dependent: :delete
      t.foreign_key :words, column: 'second_word_id', dependent: :delete
    end
  end

  def down
    change_table :associations do |t|
      t.remove_foreign_key :words
    end
  end
end
