# frozen_string_literal: true

module Api
  class WeatherController < ApplicationController
    def index
      if cache_weather&.fetched_less_than_1_hour?
        data = cache_weather.data
      else
        data = {
          current_weather: WeatherbitApi::Request.current_weather,
          week_weather: WeatherbitApi::Request.week_weather
        }
        Cache.store_weather(data)
      end

      render json: { data: data }
    end

    private

    def cache_weather
      @cache_weather ||= Cache.weather
    end
  end
end
