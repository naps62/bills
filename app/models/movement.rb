class Movement < ActiveRecord::Base
  attribute :value, :money
  attribute :balance, :money
  attribute :categories, :word_list

  scope :recent_first, -> { order(date: :asc) }
  scope :classified, -> { where.not(categories: "") }
  scope :unclassified, -> { where(categories: [nil, ""]) }

  def details
    <<~TXT
      Date: #{formatted_date}
      Description: #{description}
      Value: #{value.format}
    TXT
  end

  def formatted_date
    date.strftime("%B %e, %Y")
  end
end
