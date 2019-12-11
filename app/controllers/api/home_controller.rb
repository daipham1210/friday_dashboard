# frozen_string_literal: true

module Api
  class HomeController < ApplicationController
    def index
      if Cache.fetched_less_than_1_hour?
        data = Cache.fetch_data
      else
        data = {
          current_weather: WeatherbitApi::Request.current_weather,
          week_weather: WeatherbitApi::Request.week_weather,
          crypto_currency: CoinmarketApi::Request.crypto_currency
        }
        Cache.store(data)
      end

      render json: data
    end
  end
end
