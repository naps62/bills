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
      header_converters: method(:sanitized_header).to_proc,
      converters: method(:sanitized_field).to_proc,
    ) do |row|
      import_movement(row)
    end
  end

  def import_movement(row)
    a = Movement.where(
      date: Date.parse(row[:data_mov]),
      description: row[:descricao],
      value: to_money(row[:credito]) - to_money(row[:debito]),
      balance: to_money(row[:saldo_disponivel])
    )

    require 'pry'; binding.pry
 end

  def sanitized_header(str)
    str.downcase.parameterize.underscore.to_sym
  end

  def sanitized_field(str)
    str.downcase.strip
  end

  def to_money(str)
    Money.new(
      (str ? str.gsub(",", "").to_f : 0)
    )
  end
end
