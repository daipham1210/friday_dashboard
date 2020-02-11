module MetailsApi
  class Connection
    BASE_URL = 'http://metals-api.com/api/'.freeze
    PATH = {
      timeseries: 'timeseries'
    }.freeze

    def self.get(path_name, params)
      params[:access_key] = ENV['metails_api_key']
      response = RestClient.get(BASE_URL + PATH[path_name], params: params)
      JSON.parse(response)
    end
  end
end
