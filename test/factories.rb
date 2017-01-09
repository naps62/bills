FactoryGirl.define do
  factory :movement do
    description { "lorem ipsum" }
    value { Money.from_amount(10) }
    balance { Money.from_amount(10) }
    date { Date.today }
    categories []
  end
end
