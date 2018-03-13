class CreateCurrencyExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_exchanges do |t|
      t.string :country_code
      t.string :currency
      t.float :rate

      t.timestamps
    end
  end
end
