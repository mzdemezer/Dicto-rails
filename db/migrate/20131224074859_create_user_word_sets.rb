class CreateUserWordSets < ActiveRecord::Migration
  def change
    create_table :user_word_sets do |t|
      t.integer :user_id, null: false
      t.integer :word_set_id, null: false
      t.column :permissions, 'char(1)', default: 'r', null: false
      t.timestamps
    end
  end
end
