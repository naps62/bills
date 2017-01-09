module Importer
  def self.cgd(csv: "data/2016.csv")
    Importer::CGD.new(csv: csv).call
  end
end
