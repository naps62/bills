require "test_helper"

describe Movement::ImportFromCGD do
  before do
    @importer = Movement::ImportFromCGD.new(csv_file: "test/fixtures/cgd.csv")
  end

  describe "sanitized_header" do
    it "sanitizes strings" do
      assert @importer.sanitized_header("Descrição. "), :descricao
    end

    it "sanitizes monetary values" do

    end
  end
end
