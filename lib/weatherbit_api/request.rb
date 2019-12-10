module WeatherbitApi
  class Request
    class <<self
      def current_weather
        params = { city_id: ENV['weatherbit_city_id'] }
        response = Connection.get :current_weather, params
        data = response['data'][0]
        {
          icon: data['weather']['icon'],
          code: data['weather']['code'],
          temp: data['temp'],
          rh: data['rh'],
          wind_spd: (data['wind_spd'] * 3.6).round(1)
        }
      end

      def week_weather
        params = { city_id: ENV['weatherbit_city_id'] }
        response = Connection.get :week_weather, params
        data = response['data'][0..6]
        data.map! do |day|
          {
            dow: Date.parse(day['valid_date']).wday,
            max_temp: day['max_temp'],
            min_temp: day['min_temp'],
            icon: day['weather']['icon'],
            pop: day['pop']
          }
        end
      end
    end
  end
end
