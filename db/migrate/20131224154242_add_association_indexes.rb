class AddAssociationIndexes < ActiveRecord::Migration
  def up
    add_index :associations, [:first_word_id, :association_type_id]
    add_index :associations, [:second_word_id, :association_type_id]
  end

  def down
    remove_index :associations, [:first_word_id, :association_type_id]
    remove_index :associations, [:second_word_id, :association_type_id]
  end
end
