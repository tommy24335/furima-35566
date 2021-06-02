FactoryBot.define do
  factory :purchase_address do
    token               { 'tok_abc000000000000' }
    postal_code         { '123-4567' }
    prefecture_id       { 1 }
    city                { '守山市' }
    address             { '1-2-4' }
    building_name       { 'ロイヤル' }
    phone_number        { '08012345678' }
    association :user
    association :item
  end
end
