class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :first_word_id, null: false
      t.integer :second_word_id, null: false
      t.integer :association_type_id, null: false
      t.timestamps
    end
  end
end
