class AddDataTitleToCaches < ActiveRecord::Migration[6.0]
  def change
    add_column :caches, :data_title, :integer, null: false
  end
end
