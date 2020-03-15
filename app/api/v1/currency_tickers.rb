require 'httparty'
module V1
  class CurrencyTickers < Grape::API
    format :json
    version 'v1', using: :path
    helpers Shared::JsonResponse
    helpers Shared::GetCoins
    resource :currency_tickers do
      desc 'List currencies endpoint'
      params do
        optional :currency_list, type: String
      end
      post '/' do
        coin_list = params[:currency_list].present?&&params[:currency_list].split('-')
        coin_list = ['ETHAUD','BTCAUD'] unless coin_list
        CaptureCoins.new(coin_list).call
        ok!(201)
      end
    end
  end
end
