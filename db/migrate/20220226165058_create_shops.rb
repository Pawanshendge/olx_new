class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
