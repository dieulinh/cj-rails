class CreateCurrencyTickers < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_tickers do |t|
      t.string :currency_name
      t.string :bid
      t.string :ask
      t.string :last

      t.timestamps
    end
  end
end
