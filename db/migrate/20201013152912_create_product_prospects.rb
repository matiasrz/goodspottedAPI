class CreateProductProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :product_prospects do |t|
      t.integer :status, default: 0, null: false
      t.string :name, null: false
      t.string :position
      t.string :country
      t.string :store

      t.timestamps
    end
    add_index :product_prospects, :name, unique: true
  end
end
