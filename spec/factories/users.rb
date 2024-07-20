FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"洋久"}
    last_name             {"山田"}
    first_name_kana       {"ヒロヒサ"}
    last_name_kana        {"ヤマダ"}
    date_of_birth         {"1986-09-21"}
  end
end