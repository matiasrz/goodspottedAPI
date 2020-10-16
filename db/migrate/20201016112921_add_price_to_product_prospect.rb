class AddPriceToProductProspect < ActiveRecord::Migration[6.0]
  def change
    add_column :product_prospects, :price, :decimal, precision: 5, scale: 3, after: :name, null: false
  end
end
