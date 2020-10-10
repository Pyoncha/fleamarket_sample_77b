FactoryBot.define do

  factory :credit_card do
    id            {"1"}
    customer_id   {"cur_111"}
    card_id       {"car_111"}
    user
    created_at    {"2020-10-11"}
    updated_at    {"2021-02-04"}
  end

end
