class MoneyType < ActiveRecord::Type::Value
  def serialize(value)
    value.cents
  end

  def deserialize(value)
    Money.new(value)
  end
end
