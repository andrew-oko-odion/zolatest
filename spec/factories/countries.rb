FactoryBot.define do
  factory :country do
    sequence :name do |n|
      "United State #{n}"
    end

    exchange_rate { rand(10**9..10**10) }
    
    population_density {rand(1.2...9.1) }
    
    sequence :country_code do |n|
      "EUR #{n}"
    end
    
    sequence :currency_code do |n|
      "USD #{n}"
    end
    
  end
end
