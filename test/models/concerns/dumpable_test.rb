require "test_helper"

describe Dumpable do
  it "can dump a class into a file and restore it again" do
    instance = DumpableTest.new(x: 1)

    instance.dump!
    new_instance = DumpableTest.load_from_dump

    assert_equal new_instance.x, instance.x
  end
end

class DumpableTest
  include Dumpable

  def initialize(x:)
    @x = x
  end

  attr_reader :x
end
