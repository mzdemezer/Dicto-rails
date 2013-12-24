class CreateSearchTabs < ActiveRecord::Migration
  def change
    create_table :search_tabs do |t|
      t.integer :user_id, null: false
      t.string :scheme_prefix, null: false, default: ''
      t.string :scheme_suffix, null: false, default: ''
      t.boolean :open, null: false, default: false
      t.timestamps
    end
  end
end
