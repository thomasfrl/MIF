class AddWeatherIdToCity < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :weather_id, :integer
  end
end
