module CoinmarketApi
  class Request
    class <<self
      def crypto_currency
        coins = %w[BTC ETH XRP XLM]
        params = { symbol: coins.join(',') }
        response = Connection.get params
        data = []
        coins.each do |coin|
          data << {
            name: coin,
            price: response['data'][coin]['quote']['USD']['price'].to_f.round(3),
            percent_change_24h: response['data'][coin]['quote']['USD']['percent_change_24h'].to_f.round(3),
            percent_change_7d: response['data'][coin]['quote']['USD']['percent_change_7d'].to_f.round(3)
          }
        end
        data
      end
    end
  end
end
