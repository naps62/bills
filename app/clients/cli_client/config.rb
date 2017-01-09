module CLIClient::Config
  def self.adapter
    case Bills.config.cli[:adapter]
    when "test" then CLIClient::Adapters::Test
    when "default" then CLIClient::Adapters::CLI
    end
  end
end
