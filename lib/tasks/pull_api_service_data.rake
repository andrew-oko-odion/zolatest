namespace :pull_api_service_data do
  desc "Pull and save data from two api services"
  task pull_data: :environment do

    FIXER_API_KEY = 'ce048278daf3c26ee55f5c07fafddd54'
    currency = Faraday.get 'http://data.fixer.io/api/latest?access_key=' + FIXER_API_KEY
    currency = JSON.parse(currency.body, symbolize_names: true)
    currency = currency[:rates]

    
    country = Faraday.get 'https://restcountries.eu/rest/v2/all?fields=name;currencies;population;latlng;flag;cioc;'
    country = JSON.parse(country.body, symbolize_names: true)   
    countries_data = []

    
    def parse_currency_code(code)
      return code if code =~ /^[A-Z ]{3}+$/
    end

    currency.map do |key, value|
      country.select do |k, v| 
        currency_code = parse_currency_code(k[:currencies][0][:code])
        if currency_code.nil? 
          next
        else
          k[:exchange_rate] = value if currency_code.to_sym == key 
        end
      end
    end
    country_instance = Country.where('updated_at < ?', 70.minutes.ago)
    country.each do |value|
      country_instance.update({name: value[:name], population_density: value[:population], country_code: value[:cioc], exchange_rate: value[:exchange_rate], currency_code: value[:currencies][0][:code]})
    end
  end 
end

