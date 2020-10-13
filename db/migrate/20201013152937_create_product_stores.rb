class CreateProductStores < ActiveRecord::Migration[6.0]
  def change
    create_table :product_stores do |t|
      t.references :product, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
