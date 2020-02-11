module MetailsApi
  class Request
    class <<self
      def timeseries
        start_date = (Date.current - 4.days).strftime('%Y-%m-%d').to_s
        end_date   = Date.current.strftime('%Y-%m-%d').to_s
        params = { base: 'USD', symbols: 'XAU',
                   start_date: start_date,
                   end_date: end_date }
        response = Connection.get :timeseries, params
        response
      end
    end
  end
end
