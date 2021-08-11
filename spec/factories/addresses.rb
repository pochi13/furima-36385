FactoryBot.define do
  factory :address do
    association :purchase
    code { 123-4567 }
    delivery_area_id  { 2 }
    municipality  { "福岡県" }
    address { 2 }
    number { 1234567891 }

    end
end

