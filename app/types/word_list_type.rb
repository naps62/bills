class WordListType < ActiveRecord::Type::Value
  def serialize(value)
    value.join(",")
  end

  def deserialize(value)
    value.split(",")
  end
end
