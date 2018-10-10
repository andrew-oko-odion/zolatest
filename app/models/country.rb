class Country < ApplicationRecord
  validates :country_code, :name, :population_density,
            :currency_code, :exchange_rate, presence: true

  def self.currencies
    api_key = '3d1b54997a7f440c4ecf00fd03a72211'
    url = 'http://data.fixer.io/api/latest?access_key=' + api_key
    currency_data = Faraday.get url
    all_currencies = JSON.parse(currency_data.body, symbolize_names: true)
    all_currencies[:rates]
  end

  def self.countries
    url = 'https://restcountries.eu/rest/v2/all?fields=name;currencies;population;latlng;cioc;'
    all_countries = Faraday.get url
    JSON.parse(all_countries.body, symbolize_names: true)
  end

  def self.order_by_exchange_rate
    all.order(exchange_rate: :desc, population_density: :desc)
  end

  def self.parse_currency_code(code)
    return code if code =~ /^[A-Z ]{3}+$/
  end

  def self.parse_data
    @currencies = currencies
    @countries = countries
    @currencies.map do |key, value|
      @countries.select do |k, v|
        currency_code = parse_currency_code(k[:currencies][0][:code])
        if currency_code.nil? 
          next
        else
          k[:exchange_rate] = value if currency_code.to_sym == key 
        end
      end
    end
  end

  def self.update_db_with_api_data
    parse_data
    countries_data = []
    @countries.each { |value| countries_data << {name: value[:name], population_density: value[:population], country_code: value[:cioc], exchange_rate: value[:exchange_rate], currency_code: value[:currencies][0][:code]} }
    if self.all.empty? 
      self.create countries_data
    else
      countries_data.each { |country| self.where(country_code: country[:country_code]).update_all(exchange_rate: country[:exchange_rate]) }
    end
  end

end
