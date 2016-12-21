require "csv"

class Movement::ImportFromCGD
  def initialize(csv_file:)
    @csv_file = csv_file
  end

  attr_reader :csv_file

  def call
    ActiveRecord::Base.transaction do
      import_from_csv
    end
  end

  def import_from_csv
    CSV.foreach(
      csv_file,
      headers: true,
      col_sep: ";",
      header_converters: method(:sanitized_header),
      converters: method(:sanitized_field),
    ) do |row|
      import_movement(row)
    end
  end

  def import_movement(row)
    Movement.where(
      date: Date.new(row[:data_mov]),
      description: row[:descricao],
      value: to_money(row[:credito]) - to_money(row[:debito]),
      balance: to_money(row[:saldo_disponivel])
    )
  end

  def sanitized_header(str)
    str.downcase.parameterize.underscore
  end

  def sanitized_field(str)
    str.downcase.strip
  end

  def to_money(str)
    Money.new(
      str.gsub(",", "").to_f
    )
  end
end
