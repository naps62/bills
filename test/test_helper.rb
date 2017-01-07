$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bills"
Bills.configure do |config|
  config.env = "test"
end

require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "factory_girl"
require "database_cleaner"

Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]
FactoryGirl.find_definitions
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with(:truncation)

class Minitest::Spec
  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
