class CurrencyTicker < ApplicationRecord
  validates_presence_of :bid, :ask, :last, :currency_name
end
