class Movement < ActiveRecord::Base
  monetize :value_cents
  monetize :balance_cents
end
