class CreateUserWordSets < ActiveRecord::Migration
  def change
    create_table :user_word_sets do |t|
      t.integer :user_id
      t.integer :word_set_id
      t.column :permissions, 'char(1)'
      t.timestamps
    end
  end
end
