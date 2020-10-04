class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :first_name,:last_name, :first_name_kana,:last_name_kana, :birth_year, presence: true
          


  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, class_name: "Item"
  has_many :sold_item, -> { where("buyer_id is not NULL") }, class_name: "Item"
  has_one  :user_address
end
