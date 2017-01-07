module Importer
  def self.cgd(csv:)
    Importer::CGD.new(csv: csv).call
  end
end
