require 'foreigner'
Foreigner.load

class AddForeignKeyToWords < ActiveRecord::Migration
  def up
    add_foreign_key :words, :word_sets, dependent: :delete
  end

  def down
    remove_foreign_key :words, :word_sets
  end
end
