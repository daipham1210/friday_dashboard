module WeatherbitApi
  class Connection
    BASE_URL = 'https://api.weatherbit.io/v2.0/'.freeze
    PATH = {
      current_weather: 'current',
      week_weather: 'forecast/daily'
    }.freeze

    def self.get(path_name, params)
      params[:key] = ENV['weatherbit_key']
      response = RestClient.get(BASE_URL + PATH[path_name], params: params)
      JSON.parse(response)
    end
  end
end
