require 'httparty'
module V1
  class CurrencyTickers < Grape::API
    format :json
    version 'v1', using: :path
    helpers Shared::JsonResponse
    helpers Shared::GetCoins

    resource :currency_tickers do
      desc 'List latest prices endpoint'
      params do
        optional :currency_list, type: String
      end
      get '/' do
        coin_list = params[:currency_list].present?&&params[:currency_list].split('-')
        coin_list = ['ETHAUD','BTCAUD'] unless coin_list
        currencies = CurrencyTicker.order('created_at DESC').where(currency_name: coin_list).limit(coin_list.length)
        present currencies
      end

      desc 'Capture currencies endpoint'
      params do
        optional :currency_list, type: String
      end
      post '/' do
        coin_list = params[:currency_list].present? && params[:currency_list].split('-')
        coin_list = ['ETHAUD','BTCAUD'] unless coin_list
        CaptureCoins.new(coin_list).call
        currencies = CurrencyTicker.order('created_at DESC').limit(coin_list.length)
        present currencies, status: 201
      end

      desc 'History currency endpoint'
      get '/:currency_name' do
        currency_name = params[:currency_name]
        present CurrencyTicker.where(currency_name: currency_name).order('created_at DESC')
      end
    end
  end
end
