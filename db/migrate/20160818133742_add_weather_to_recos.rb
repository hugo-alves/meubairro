class AddWeatherToRecos < ActiveRecord::Migration
  def change
    add_column :recos, :weather_type, :string
  end
end
