FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test@test.com"}
    password {"00000f"}
    password_confirmation {password}
    first_name {"山田"}
    last_name {"太郎"}
    huri_first_name {"ヤマダ"}
    huri_last_name {"タロウ"}
    birthday {"2000-01-01"}
  end
end