class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.string :postal_code  ,null: false
      t.string :prefecture   ,null: false
      t.string :city      ,null: false
      t.string :adrress    ,null: false
      t.string :building    
      t.string :phone_number  
      t.references :user
      t.timestamps
    end
  end
end
