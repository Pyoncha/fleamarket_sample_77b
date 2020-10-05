class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.string :postal_code,        null: false
      t.string :prefecture,         null: false
      t.string :city,               null: false
      t.string :adrress,            null: false
      t.string :building    
      t.string :phone_number  
      t.references :user
      t.timestamps
    end
  end
end
