FactoryBot.define do
  factory :item do
    name                    {"キウイ"}
    describe                {"新鮮なキウイです"}
    brand                   {"ゼスプリ"}
    condition_id            {"1"}
    shipping_charge_id      {"1"}
    prefecture_id           {"1"}
    delivery_date_id        {"1"}
    price                   {"500"}
    user
    after(:build) do |item|
      # 画像の紐付け
      item.images << build(:image)
      # create(:grand_child_category)のfactoryの中で、親の定義、さらに親の定義が始まる。
      item.category_id = create(:grand_child_category).id
    end
  end
end
