module Bills
  class Config
    def initialize
      @env = ENV["BILLS_ENV"] || "development"
    end

    attr_accessor :env
  end
end
