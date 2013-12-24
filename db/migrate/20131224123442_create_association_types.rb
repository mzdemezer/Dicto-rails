class CreateAssociationTypes < ActiveRecord::Migration
  def change
    create_table :association_types do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
