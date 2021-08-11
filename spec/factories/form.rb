FactoryBot.define do
  factory :form do
    
    code { "123-4567" }
    delivery_area_id  { 2 }
    municipality  { "福岡県" }
    address { 2 }
    number { 1234567891 }
    user_id {1}
    item_id {1}
    token {"tok_abcdefghijk00000000000000000"}

    end
end
