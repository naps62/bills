module Bills
  module DB
    def self.connect
      ActiveRecord::Base.establish_connection(
        YAML.load_file("db/config.yml")[Bills.config.env]
      )
    end
  end
end
