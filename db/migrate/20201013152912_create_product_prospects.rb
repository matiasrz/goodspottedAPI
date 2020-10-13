class CreateProductProspects < ActiveRecord::Migration[6.0]
  def change
    create_table :product_prospects do |t|
      t.integer :status
      t.string :name
      t.string :position
      t.string :country
      t.string :store

      t.timestamps
    end
  end
end
