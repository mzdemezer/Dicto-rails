class AddLearntsIndex < ActiveRecord::Migration
  def up
    add_index :learnts, [:word_id, :user_id]
  end

  def down
    remove_index :learnts, [:word_id, :user_id]
  end
end
