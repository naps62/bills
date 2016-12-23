module Dumpable
  extend ActiveSupport::Concern

  def dump!
    self.class.save_to_dump(self)
  end

  module ClassMethods
    def save_to_dump(instance)
      File.open(dump_filename, "wb") do |f|
        data = Marshal.dump(instance)

        f.write data
      end
    end

    def load_from_dump
      data = File.read(dump_filename)

      Marshal.load(data)
    end

    def dump_filename
      "db/#{name.underscore}.#{Bills.config.env}.dump"
    end
  end
end
