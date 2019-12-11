class Cache < ApplicationRecord
  before_save do |cache|
    cache.fetched_at = Time.current
  end

  class <<self
    def fetched_less_than_1_hour?
      cache = Cache.fetched_cache
      return false unless cache

      ((Time.current - cache.fetched_at) / 3600).round.zero?
    end

    def fetched_cache
      @fetched_cache ||= Cache.first
    end

    def fetch_data
      Cache.fetched_cache.data
    end

    def store(data)
      cache = Cache.fetched_cache || Cache.new
      cache.data = data
      cache.save!
    end
  end
end
