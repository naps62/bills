require "rubygems"
require "bundler/setup"
Bundler.require(:default)

require "active_support/core_ext/string"

require "bills/autoload"
require "bills/config"
require "bills/db"
require "bills/version"

module Bills
  class << self
    def configure
      @config ||= Config.new
      yield @config if block_given?
      Bills::DB.connect
      ActiveRecord::Type.register(:money, MoneyType)
      @config
    end

    attr_reader :config
  end
end
