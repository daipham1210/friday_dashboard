module CoinmarketApi
  class Connection
    BASE_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest'.freeze

    def self.get(params)
      headers = { 'X-CMC_PRO_API_KEY' => ENV['coinmarket_key'],
                  'Accept' => 'application/json' }
      headers['params'] = params
      response = RestClient::Request.execute(method: :get, url: BASE_URL,
                                             headers: headers)
      JSON.parse(response)
    end
  end
end
