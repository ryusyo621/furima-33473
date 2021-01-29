FactoryBot.define do
  factory :item do
    product_name { 'バッグ' }
    product_text { '持ち運びも楽' }
    category_id { 2 }
    state_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    shiping_id { 2 }
    price { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
