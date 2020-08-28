class ShippingCharge < ActiveHash::Base

  self.data = [
    {id: 1, defrayer: '送料込み（出品者負担）'}, {id: 2, defrayer: '着払い（購入者負担）'}
  ]

  include ActiveHash::Associations
  has_many :items

end