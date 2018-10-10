module Api
  module V1
    class CountriesController < ApplicationController
      before_action :find_country, only: [:show]

      def index
        @countries = Country.order_by_exchange_rate
        render json: @countries, status: :ok
      end

      def show
        render json: @country, status: :ok
      end

      private

      def country_params
        params.require(:data).permit(:name, :country_code,
                                     :currency_code, :population_density)
      end

      def find_country
        @country = Country.find params[:id]
      end
    end
  end
end
