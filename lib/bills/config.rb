module Bills
  class Config
    def initialize
      @env = ENV["BILLS_ENV"] || "development"
      @cli = {
        adapter: (env == "test" ? "test" : "default")
      }
    end

    attr_accessor :env, :cli
  end
end
