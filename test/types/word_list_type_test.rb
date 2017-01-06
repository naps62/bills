require "test_helper"

describe WordListType do
  it "serializes money value" do
    words = %w(a b c)

    assert WordListType.new.serialize(words) == "a,b,c"
  end

  it "deserializes money value" do
    words = "a,b,c"

    assert WordListType.new.deserialize(words) == %w(a b c)
  end
end
