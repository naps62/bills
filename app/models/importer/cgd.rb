require "csv"

class Importer::CGD
  def initialize(csv:)
    @csv = csv
  end

  attr_reader :csv

  def call
    ActiveRecord::Base.transaction do
      import_from_csv
    end
  end

  def import_from_csv
    ids = []
    CSV.foreach(
      csv,
      headers: true,
      col_sep: ";",
      header_converters: method(:sanitized_header).to_proc,
      converters: method(:sanitized_field).to_proc,
    ) do |row|
      ids << import_movement(row).id
    end

    Movement.where(id: ids)
  end

  def import_movement(row)
    Movement.where(
      date: Date.parse(row[:data_mov]),
      description: row[:descricao],
      value: to_money(row[:credito]) - to_money(row[:debito]),
      balance: to_money(row[:saldo_disponivel])
    ).first_or_create
 end

  def sanitized_header(str)
    str.downcase.parameterize.underscore.to_sym
  end

  def sanitized_field(str)
    str.downcase.strip
  end

  def to_money(str)
    Money.from_amount(
      (str.present? ? str.gsub(".", "").gsub(",", ".").to_f : 0)
    )
  end
end
