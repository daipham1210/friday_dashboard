class Cache < ApplicationRecord
  enum data_title: {
    weather: 0,
    crypto_currency: 1,
    gold_price: 2
  }

  before_save do |cache|
    cache.fetched_at = Time.current
  end

  def fetched_less_than_1_hour?
    ((Time.current - fetched_at) / 3600).round.zero?
  end

  class <<self
    Cache.data_titles.keys.each do |title|
      define_method title do
        Cache.find_by(data_title: title.to_sym)
      end

      define_method "store_#{title}" do |data|
        Cache.find_or_initialize_by(data_title: title.to_sym).update(data: data)
      end
    end
  end

end
