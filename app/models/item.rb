class Item < ApplicationRecord
  # ↓レビュー動作確認用(オプション)
  belongs_to :user, optional: true
  has_many :images
  # belongs_to :category
  # belongs_to :brand

  # ↓レビュー動作確認用(オプション)
  belongs_to :buyer, class_name: "User", optional: true

  # fields_forメソッドを利用する際に、親モデルの中に書く必要があるメソッド
  accepts_nested_attributes_for :images, allow_destroy: true
  
  # active_hashを使用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :describe, length: { maximum: 1000 }
    validates :category
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :delivery_date_id
  end
end
