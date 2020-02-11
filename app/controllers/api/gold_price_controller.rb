# frozen_string_literal: true

module Api
  class GoldPriceController < ApplicationController
    def index
      if cache_gold_price&.fetched_less_than_1_hour?
        data = cache_gold_price.data
      else
        data = MetailsApi::Request.timeseries
        # Cache.store_gold_price(data)
      end

      render json: { data: data }
    end

    private

    def cache_gold_price
      @cache_gold_price ||= Cache.gold_price
    end
  end
end
