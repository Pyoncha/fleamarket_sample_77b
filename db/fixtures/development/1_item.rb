Item.seed do |s|
  s.id = 1
  s.name = "ハンバーガー"
  s.price = "2200"
  s.describe = "ハンバーガーです。"
  s.condition_id = 3
  s.shipping_charge_id = 1
  s.prefecture_id = 42
  s.delivery_date_id = 2
  s.buyer_id = 2
  s.user_id = 1
  s.category = "-"
end
Item.seed do |s|
  s.id = 2
  s.name = "本マグロ"
  s.price = "1200000"
  s.describe = "さばいていく！"
  s.condition_id = 1
  s.shipping_charge_id = 2
  s.prefecture_id = 2
  s.delivery_date_id = 3
  s.buyer_id = 5
  s.user_id = 2
  s.category = "-"
end
Item.seed do |s|
  s.id = 3
  s.name = "iCon"
  s.price = "20000"
  s.describe = "iconです。"
  s.condition_id = 2
  s.shipping_charge_id = 1
  s.prefecture_id = 13
  s.delivery_date_id = 1
  s.buyer_id = nil
  s.user_id = 3
  s.category = "-"
end
Item.seed do |s|
  s.id = 4
  s.name = "iCon2"
  s.price = "3000"
  s.describe = "iconです。2"
  s.condition_id = 2
  s.shipping_charge_id = 1
  s.prefecture_id = 13
  s.delivery_date_id = 1
  s.buyer_id = nil
  s.user_id = 4
  s.category = "-"
end
Item.seed do |s|
  s.id = 5
  s.name = "Special_icon"
  s.price = "430000"
  s.describe = "specialなiconです。"
  s.condition_id = 1
  s.shipping_charge_id = 1
  s.prefecture_id = 13
  s.delivery_date_id = 1
  s.buyer_id = 4
  s.user_id = 5
  s.category = "-"
end
Item.seed do |s|
  s.id = 6
  s.name = "本マグロ"
  s.price = "1000000"
  s.describe = "新鮮だよ！"
  s.condition_id = 1
  s.shipping_charge_id = 2
  s.prefecture_id = 2
  s.delivery_date_id = 3
  s.buyer_id = nil
  s.user_id = 2
  s.category = "-"
end