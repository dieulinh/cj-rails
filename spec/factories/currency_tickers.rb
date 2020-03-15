FactoryBot.define do
  factory :currency_ticker do
    currency_name { %w(ETHAUD BTCAUD).sample }
    bid { '344' }
    ask { '123' }
    last { '234' }
  end
end
