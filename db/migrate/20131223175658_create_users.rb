class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.boolean :admin, null: false, default: false
      t.integer :learnt_threshold, null: false, default: 20
      t.timestamps
    end
  end
end
