FactoryBot.define do
  factory :image do
    image { File.open("#{Rails.root}/public/apple-touch-icon.png") }
  end
end
