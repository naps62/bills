require "test_helper"

describe MoneyType do
  it "serializes money value" do
    money = Money.from_amount(1000)

    assert MoneyType.new.serialize(money) == 100000
  end

  it "deserializes money value" do
    money = Money.from_amount(1000)

    assert MoneyType.new.deserialize(100000) == money
  end
end
