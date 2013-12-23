class CreateWordSets < ActiveRecord::Migration
  def up
    create_table :word_sets do |t|
      t.string :name
    end
  end

  def down
    drop_table :word_sets
  end
end
