class API < Grape::API
  format :json
  rescue_from :all, backtrace: true

  mount V1::CurrencyTickers

  rescue_from Grape::Exceptions::ValidationErrors  do |e|
    rack_response({
      status: e.status,
      error_msg: e.message
  }.to_json, 400)
  end
end
