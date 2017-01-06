class Movement < ActiveRecord::Base
  attribute :value, :money
  attribute :balance, :money
  attribute :categories, :word_list
end
