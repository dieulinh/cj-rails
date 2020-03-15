require 'rails_helper'
describe V1::CurrencyTickers, type: :request do
  describe 'post /api/v1/currency_tickers' do
    let(:currency_1) { create(:currency_ticker) }
    let(:currency_2) { create(:currency_ticker) }
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
end
