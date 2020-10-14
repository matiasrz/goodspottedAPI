class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :product_prospect, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :price, precision: 5, scale: 3

      t.timestamps
    end
    add_index :products, :name, unique: true
  end
end
