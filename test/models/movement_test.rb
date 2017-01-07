require "test_helper"

describe Movement do
  describe ".recent_first" do
    it "puts newer movements first" do
      movements = [
        create(:movement, date: 2.months.ago),
        create(:movement, date: 3.months.ago),
      ]

      assert Movement.recent_first.pluck(:id) == movements.reverse.map(&:id)
    end
  end

  describe ".classified" do
    it "selects classified movements" do
      create(:movement, categories: %w(a))

      assert Movement.classified.any?
    end

    it "does not selects unclassified movements" do
      create(:movement, categories: [])

      assert Movement.classified.none?
    end
  end

  describe ".unclassified" do
    it "selects unclassified movements" do
      create(:movement, categories: [])

      assert Movement.unclassified.any?
    end

    it "does not selects classified movements" do
      create(:movement, categories: %w(a b))

      assert Movement.unclassified.none?
    end
  end
end
