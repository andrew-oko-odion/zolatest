class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :country_code
      t.string :name
      t.integer :population_density
      t.string :currency_code
      t.decimal :exchange_rate

      t.timestamps
    end
  end
end
