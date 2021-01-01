class AddPositionToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :latitude, :string, after: :name, null: false
    add_column :stores, :longitude, :string, after: :latitude, null: false
  end
end
