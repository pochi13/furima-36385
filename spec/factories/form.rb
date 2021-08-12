FactoryBot.define do
  factory :form do
    
    code { "123-4567" }
    delivery_area_id  { '2'}
    municipality  { "福岡県" }
    address { '2' }
    number { '1234567891' }
    build {'青山ビル'}
    token {"tok_abcdefghijk00000000000000000"}

    end
end
