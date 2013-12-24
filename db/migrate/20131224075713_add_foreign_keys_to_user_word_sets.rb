require 'foreigner'
Foreigner.load

class AddForeignKeysToUserWordSets < ActiveRecord::Migration
  def up
    change_table :user_word_sets do |t|
      t.foreign_key :users, dependent: :delete
      t.foreign_key :word_sets, dependent: :delete
    end
  end

  def down
    change_table :user_word_sets do |t|
      t.remove_foreign_key :users
      t.remove_foreign_key :word_sets
    end
  end
end
