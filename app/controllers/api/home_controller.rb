module Api
  class HomeController < ApplicationController
    def index
      render json: {
        current_weather: WeatherbitApi::Request.current_weather,
        week_weather: WeatherbitApi::Request.week_weather,
        crypto_currency: CoinmarketApi::Request.crypto_currency
      }
    end
  end
end
