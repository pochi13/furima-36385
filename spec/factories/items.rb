FactoryBot.define do
  factory :item do
    association :user
      name { '太郎' }
      explan { '太郎' }
      detail_category_id { 2 }
      detail_status_id  { 2 }
      delivery_charge_id { 2 }
      delivery_area_id { 2 }
      delivery_indication_id { 2 }
      price {10000}
      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.png')
      end
      
  end
end
  
