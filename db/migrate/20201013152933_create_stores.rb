class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
    add_index :stores, :name, unique: true
  end
end
