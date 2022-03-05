class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :likeable_id
      t.string :likeable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
