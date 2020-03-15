require 'rails_helper'
describe V1::CurrencyTickers, type: :request do
  describe 'post /api/v1/currency_tickers' do
    let(:params) { { currency_list: 'ETHAUD' } }
    subject { post('/api/v1/currency_tickers', params: params) }
    it 'calls capture coins service' do
      expect(CaptureCoins).to receive_message_chain(:new, :call)
      subject
    end
    it 'returns code 201' do
      subject
      expect(response.code).to eq('201')
    end
  end
  describe 'get /api/v1/currency_tickers' do
    let(:currency_1) { create(:currency_ticker, currency_name: 'ETHAUD') }
    let(:currency_2) { create(:currency_ticker) }
    let(:params) { { currency_list: 'ETHAUD' } }
    before do
      currency_1
      currency_2
    end
    subject { get('/api/v1/currency_tickers', params: params) }
    it 'calls capture coins service' do
      subject
      expect(JSON.parse(response.body)[0]['ask']).to eq(currency_1.ask)
      expect(JSON.parse(response.body)[0]['bid']).to eq(currency_1.bid)
      expect(JSON.parse(response.body)[0]['last']).to eq(currency_1.last)
    end
    it 'returns code 200' do
      subject
      expect(response.code).to eq('200')
    end
  end
end
