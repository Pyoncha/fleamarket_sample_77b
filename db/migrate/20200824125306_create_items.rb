class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :describe, null: false

      # Active_hashを使用
      t.integer :condition_id, null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_date_id, null: false

      # 出品機能実装につきbuyer_idをintegerで仮置き本番はreference
      t.integer :buyer_id

      # category, brandをstringで仮置き
      t.string :category, null: false
      t.string :brand

      # Userモデル、Categoryモデル、Brandモデル作成時に使用
      # t.references :user, null: false, foreign_key: true
      # t.references :category, null: false, foreign_key: true
      # t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
