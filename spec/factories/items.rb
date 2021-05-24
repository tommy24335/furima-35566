FactoryBot.define do
  factory :item do
    name           { 'test' }
    description    { 'testtest' }
    category_id       { 1 }
    item_status_id    { 1 }
    sipping_cost_id   { 1 }
    prefecture_id     { 1 }
    sipping_day_id    { 1 }
    price { 500 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
