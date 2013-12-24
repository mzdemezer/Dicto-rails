class CreateLearnts < ActiveRecord::Migration
  def up
    create_table :learnts do |t|
      t.integer :user_id, null: false
      t.integer :word_id, null: false
      t.integer :value, null: false, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :learnts
  end
end
