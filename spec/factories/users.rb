FactoryBot.define do
  factory :user do
    nickname              { 'tommy' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { password }
    famiry_name           { '冨永' }
    last_name             { '遼太' }
    famiry_name_kana      { 'トミナガ' }
    last_name_kana        { 'リョウタ' }
    birth_day             { '1996-02-05' }
  end
end
