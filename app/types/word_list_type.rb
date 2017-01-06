class WordListType < ActiveRecord::Type::Value
  def serialize(value)
    if value.is_a?(String)
      value
    else
      value.join(",")
    end
  end

  def deserialize(value)
    value.split(",")
  end
end
