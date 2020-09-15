FactoryBot.define do
  factory :order_address do
      phone { Faker::Number.number(digits:11) }
      address_line { Faker::Lorem.sentence }
      city { Faker::Lorem.sentence }
      prefecture_id { Faker::Number.within(range: 1..47) }
      building { Faker::Lorem.sentence }
      token { Faker::Number.number(digits:10) }
      postal_code { "170-0001" }
    end
end