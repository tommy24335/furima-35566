class CreateSippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :sipping_addresses do |t|
      t.string :address,               null: false, default: ""
      t.string :building_name         
      t.string :city,                    null: false, default: ""
      t.string :prefecture_id,           null: false
      t.string :postal_code,             null: false, default: ""
      t.string :phone_number,            null: false, default: ""
      t.references :purchase_management,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
