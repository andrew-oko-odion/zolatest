class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :country_code, :currency_code, :population_density, :exchange_rate
end
