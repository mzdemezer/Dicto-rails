class AddUserWordSetsIndex < ActiveRecord::Migration
  def up
    add_index :user_word_sets, [:word_set_id, :user_id], unique: true
  end

  def down
    remove_index :user_word_sets, [:word_set_id, :user_id]
  end
end
