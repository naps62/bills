class Movement < ActiveRecord::Base
  attribute :value, :money
  attribute :balance, :money
  attribute :categories, :word_list

  scope :recent_first, -> { order(date: :asc) }
  scope :classified, -> { where.not(categories: "") }
  scope :unclassified, -> { where(categories: [nil, ""]) }
end
