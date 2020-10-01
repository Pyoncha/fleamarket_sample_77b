class UserAddress < ApplicationRecord
  belongs_to :user optional:true
  validates :postal_code, :prefecture, :city, :address, presence: true
end
