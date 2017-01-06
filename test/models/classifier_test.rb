require "test_helper"

describe Classifier do
  it "can learn how to classify equal movements" do
    movement = build :movement, description: "Rent", categories: ["House"]
    classifier = Classifier.new

    classifier.train_with_movement(movement)

    assert classifier.classify(movement).first == "House"
  end

  it "can learn how to classify similar movements" do
    movement1 = build :movement, description: "Rent", categories: ["House"]
    movement2 = build :movement, description: "Buying a mercedes", categories: ["Wasting"]
    movement3 = build :movement, description: "Half of my Rent"
    movement4 = build :movement, description: "My second mercedes"
    classifier = Classifier.new

    classifier.train_with_movement(movement1)
    classifier.train_with_movement(movement2)

    assert classifier.classify(movement3).first == "House"
    assert classifier.classify(movement4).first == "Wasting"
  end
end
