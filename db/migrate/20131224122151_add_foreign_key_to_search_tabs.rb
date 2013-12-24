class AddForeignKeyToSearchTabs < ActiveRecord::Migration
  def up
    change_table :search_tabs do |t|
      t.foreign_key :users, dependent: :delete
    end
  end

  def down
    change_table :search_tabs do |t|
      t.remove_foreign_key :users
    end
  end
end
