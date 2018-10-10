class CountrySerializer < ActiveModel::Serializer
  attributes :name, :country_code, :currency_code, :population_density, :exchange_rate, :updated_at, :id
end
