class Country < ApplicationRecord
validates :country_code, :name, :population_density, :currency_code, :exchange_rate, presence: true  
end
