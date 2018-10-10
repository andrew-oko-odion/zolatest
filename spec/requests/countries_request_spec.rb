
RSpec.describe 'Countries', type: :request, capture_examples: true do
  path '/countries' do
    get(summary: 'Get countries') do
      consumes 'application/json'
      produces 'application/json'
      tags :countries

      let!(:countries) do
        3.times do
          create(:country)
        end
      end

      response(200, description: 'Return all the available countries') do
        it 'Return 3 countries' do
          body = JSON(response.body)
          expect(body.count).to eq(3)
        end
      end
    end
  end

  path '/countries/{id}' do
    get(summary: 'Get Countries') do
      consumes 'application/json'
      produces 'application/json'
      tags :countries

      parameter :id, in: :path, type: :integer, required: true, description: 'Country ID'

      let(:country_1) do
        create(:country)
      end

      let(:country_2) do
        create(:country)
      end

      response(200, description: 'Return the selected country') do
        let(:id) { country_1.id }
      end

      response(404, description: 'Country not found') do
        let(:id) { 999 }
      end
    end
  end
end
