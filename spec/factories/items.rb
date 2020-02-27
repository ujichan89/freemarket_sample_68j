FactoryBot.define do

  factory :item do
    name                  {"sample"}
    description           {"sample"}
    status                {"良好"}
    charge                {"着払い(購入者負担)"}
    area                  {"0"}
    day                   {"2"}
    price                 {000}
    category
    user
  end
  
end