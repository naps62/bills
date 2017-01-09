require "test_helper"

describe CLIClient::Adapters::Test do
  before do
    @adapter = Clients::CLI::Adapters::Test.new
  end

  decribe "#puts" do
    it "fakes stdout" do
      @adapter.puts "something"

      assert @adapter.stdout.match?("something")
    end
  end
end
