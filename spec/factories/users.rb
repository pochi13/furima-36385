FactoryBot.define do
  factory :user do

    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '佐藤' }
    first_name { '健' }
    last_name_kana { 'サトウ' }
    first_name_kana { 'タカシ' }
    birthday { '2021-08-04' }
  end
end

