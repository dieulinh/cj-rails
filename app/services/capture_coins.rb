require 'httparty'

class CaptureCoins
  def initialize(coin_list)
    @coin_list = coin_list
  end
  def call
    begin
      @coin_list.each do |coin_name|
        url = "https://data.exchange.coinjar.com/products/#{coin_name}/ticker"
        response = HTTParty.get(url)
        currency = CurrencyTicker.new response.parsed_response.symbolize_keys.slice(:bid, :ask, :last).merge(currency_name: coin_name)
        currency.save
      end
      true
    rescue => error
      puts error
      false
    end
  end
end
