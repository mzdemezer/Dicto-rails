class AddForeignKeysToAssociations < ActiveRecord::Migration
  def up
    change_table :associations do |t|
      t.foreign_key :association_types, dependent: :delete
      t.foreign_key :words, column: 'first_word_id', name: 'associations_first_word_id_fk', dependent: :delete
      t.foreign_key :words, column: 'second_word_id', name: 'associations_second_word_id_fk', dependent: :delete
    end
  end

  def down
    change_table :associations do |t|
      t.remove_foreign_key :association_types
      t.remove_foreign_key name: 'associations_first_word_id_fk'
      t.remove_foreign_key name: 'associations_second_word_id_fk'
    end
  end
end
