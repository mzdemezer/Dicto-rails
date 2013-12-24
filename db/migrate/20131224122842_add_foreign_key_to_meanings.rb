require 'foreigner'
Foreigner.load

class AddForeignKeyToMeanings < ActiveRecord::Migration
  def up
    change_table :meanings do |t|
      t.foreign_key :words, dependent: :delete
    end
  end

  def down
    change_table :meanings do |t|
      t.remove_foreign_key :words
    end
  end
end
