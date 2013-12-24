class CreateMeanings < ActiveRecord::Migration
  def change
    create_table :meanings do |t|
      t.integer :word_id, null: false
      t.text :text
      t.timestamps
    end
  end
end
