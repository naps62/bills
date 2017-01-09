class Movement < ActiveRecord::Base
  attribute :value, :money
  attribute :balance, :money
  attribute :categories, :word_list

  scope :recent_first, -> { order(date: :asc) }
  scope :classified, -> { where.not(categories: "") }
  scope :unclassified, -> { where(categories: [nil, ""]) }

  default_scope -> { recent_first }

  def details
    <<~TXT
      Date: #{formatted_date}
      Description: #{description}
      Value: #{formatted_value}
    TXT
  end

  def formatted_value
    value.format.rjust(9)
  end

  def formatted_date
    date.strftime("%b %e, %Y")
  end

  def table_row
    [
      formatted_date,
      description,
      formatted_value,
      categories.join(", ").presence || "N/A"
    ]
  end

  def self.printable_table
    rows = []
    rows << %w(Date Description Value Categories)
    rows.concat(all.map(&:table_row))

    Terminal::Table.new rows: rows
  end

  def self.remove_classifications!
    Movement.classified.update_all categories: []
  end
end
