require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.configure do |config|
  # Specify a root directory where the generated Swagger files will be saved.
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and global metadata for each.
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        createContact: {
          type: :object,
          properties: {
            data: {
              type: :object,
              required: %i[name country_code exchange_rate currency_code population_density],
              properties: {
                name: { type: :string, example: 'United State' },
                exchange_rate: { type: :decimal, example: '14.229393' },
                currency_code: { type: :string, example: 'USD' },
                country_code: { type: :string, example: 'NGN' },
                population_density: { type: :integer, example: '288182882' }
              }
            }
          }
        }
      }
    }
  }
end
