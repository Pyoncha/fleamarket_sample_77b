FactoryBot.define do
  factory :item do
    name                    {"キウイ"}
    describe                {"新鮮なキウイです"}
    category                {"食品"}
    condition_id            {"1"}
    shipping_charge_id      {"1"}
    prefecture_id           {"1"}
    delivery_date_id        {"1"}
    price                   {"500"}
  end
end
