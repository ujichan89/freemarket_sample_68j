FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"山田"}
    first_name            {"彩"}
    family_furigana       {"ヤマダ"}
    first_furigana        {"アヤ"}
    birthday_year         {"1990"}
    birthday_month        {"01"}
    birthday_day          {"01"}
  end


  factory :address do
    family_name           {"山田"}
    first_name            {"彩"}
    family_furigana       {"ヤマダ"}
    first_furigana        {"アヤ"}
    number                {"0901234567"}
    prefecture            {"北海道"}
    municipality          {"サンプル"}
    street                {"テキスト"}
  end
end