require 'test_helper'

class CurrencyTickerTest < ActiveSupport::TestCase
  test "invalid if bid or ask or currency name or last blank" do
    currency_ticker1 = CurrencyTicker.new
    assert_not currency_ticker1.valid?
  end
  test "valid if bid and ask and currency name and last blank" do
    currency_ticker1 = CurrencyTicker.new( currency_name: 'BTCAUD', bid: '8925.00000000',ask: '9008.00000000', last: '9008.00000000')
    assert currency_ticker1.valid?
  end
end
