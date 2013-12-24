class AddForeignKeysToLearnts < ActiveRecord::Migration
  def up
    change_table :learnts do |t|
      t.foreign_key :users, dependent: :delete
      t.foreign_key :words, dependent: :delete
    end
  end

  def down
    change_table :learnts do |t|
      t.remove_foreign_key :users
      t.remove_foreign_key :words
    end
  end
end
