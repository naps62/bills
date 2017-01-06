require "test_helper"

describe WordListType do
  it "serializes an array of words value" do
    words = %w(a b c)

    assert WordListType.new.serialize(words) == "a,b,c"
  end

  it "keeps strings as they are" do
    words = "a b c"

    assert WordListType.new.serialize(words) == "a b c"
  end

  it "deserializes comma-separated word lists value" do
    words = "a,b,c"

    assert WordListType.new.deserialize(words) == %w(a b c)
  end
end
