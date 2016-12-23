$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bills"
Bills.configure do |config|
  config.env = "test"
end

require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
