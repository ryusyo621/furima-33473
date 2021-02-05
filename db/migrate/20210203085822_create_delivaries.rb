class CreateDelivaries < ActiveRecord::Migration[6.0]
  def change
    create_table :delivaries do |t|
      t.string :post_number, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building, null: false
      t.string :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
