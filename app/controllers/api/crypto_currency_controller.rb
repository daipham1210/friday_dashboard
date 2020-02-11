# frozen_string_literal: true

module Api
  class CryptoCurrencyController < ApplicationController
    def index
      if cache_crypto&.fetched_less_than_1_hour?
        data = cache_crypto.data
      else
        data = CoinmarketApi::Request.crypto_currency
        Cache.store_crypto_currency(data)
      end

      render json: { data: data }
    end

    private

    def cache_crypto
      @cache_crypto ||= Cache.crypto_currency
    end
  end
end
