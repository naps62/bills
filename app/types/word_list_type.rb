class WordListType < ActiveRecord::Type::Value
  def serialize(value)
    if value.is_a?(String)
      value.parameterize
    else
      value.map(&:downcase).map(&:parameterize).join(",")
    end
  end

  def deserialize(value)
    return [] unless value

    value.split(",").map(&:parameterize)
  end
end
