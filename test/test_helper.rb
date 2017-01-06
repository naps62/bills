$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bills"
Bills.configure do |config|
  config.env = "test"
end

require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]

require "factory_girl"
FactoryGirl.find_definitions
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end
