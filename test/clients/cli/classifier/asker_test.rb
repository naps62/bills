require "test_helper"

describe CLIClient::Classifier::Asker do
  before do
    movement = build :movement

    @asker = CLIClient::Classifier::Asker.new(movement: movement)

    CLIClient::Adapters::Test.stdout << [
      "something"
    ]
  end

  it "shows the movement's details" do
    @asker.call
  end
end
