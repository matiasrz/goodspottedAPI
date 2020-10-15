class CreateAllowlistedJwts < ActiveRecord::Migration[6.0]
  def change
    create_table :allowlisted_jwts do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :jti,    null: false
      t.string :aud,    null: false
      t.datetime :exp,  null: false

      t.timestamps
    end

    add_index :allowlisted_jwts, :jti, unique: true
  end
end
