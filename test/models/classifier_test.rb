require "test_helper"

describe Classifier do
  it "can learn how to classify equal strings" do
    classifier = Classifier.new

    classifier.train("Rent", ["House"])

    assert classifier.classify("Rent").first == "House"
  end

  it "can learn how to classify similar movements" do
    movement1 = build :movement, description: "Rent", categories: ["House"]
    movement2 = build :movement, description: "Buying a mercedes", categories: ["Wasting"]
    movement3 = build :movement, description: "Half of my Rent"
    movement4 = build :movement, description: "My second mercedes"
    classifier = Classifier.new

    classifier.train("Rent", ["House"])
    classifier.train("Buying a mercedes", ["Wasting"])

    assert classifier.classify("Half of my Rent").first == "House"
    assert classifier.classify("My second mercedes").first == "Wasting"
  end
end
