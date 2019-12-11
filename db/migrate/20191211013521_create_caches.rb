class CreateCaches < ActiveRecord::Migration[6.0]
  def change
    create_table :caches do |t|
      t.jsonb 'data', default: {}
      t.timestamp 'fetched_at'
    end
  end
end
