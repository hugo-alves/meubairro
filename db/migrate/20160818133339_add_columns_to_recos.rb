class AddColumnsToRecos < ActiveRecord::Migration
  def change
    add_column :recos, :category, :string
    add_column :recos, :day_time, :string
    add_column :recos, :photo, :string
  end
end
