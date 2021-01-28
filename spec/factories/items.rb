FactoryBot.define do
  factory :item do
    product_name {"test"}
    product_text {"test@test.com"}
    category_id {"00000f"}
    state_id {password}
    burden_id {"山田"}
    area_id {"太郎"}
    shiping_id {"ヤマダ"}
    price {"タロウ"}
    association :user
  end
end
