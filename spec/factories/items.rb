FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    detail { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 1..10) }
    status_id { Faker::Number.within(range: 1..10) }
    delivery_fee_id { Faker::Number.within(range: 1..2) }
    prefecture_id { Faker::Number.within(range: 1..47) }
    shipping_date_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user 
  end
end
