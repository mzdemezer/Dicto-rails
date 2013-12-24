class CreateWords < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.integer :word_set_id, null: false
      t.string :text, null: false
      t.string :pronounciation
      t.timestamps
    end
  end

  def down
    drop_table :words
  end
end
