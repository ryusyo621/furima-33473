FactoryBot.define do
  factory :order do
    post_number { '123-4567' }
    area_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
