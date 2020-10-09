class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :credit_card
  # 伊藤直し
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, presence: true
  # 伊藤足し
  # validates :email ,presence: true ,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # validates :password, presence: true, length: { minimum: 7 }, format: { with: /(?=.*\d+.*)(?=.*[a-zA-Z]+.*)./ }

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, class_name: "Item"
  has_many :sold_item, -> { where("buyer_id is not NULL") }, class_name: "Item"
  has_one  :user_address
end
#  伊藤覚書 チェックボックス
# validates :カラム名, acceptance: true