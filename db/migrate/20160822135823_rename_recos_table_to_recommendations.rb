class RenameRecosTableToRecommendations < ActiveRecord::Migration
  def change
    rename_table :recos, :recommendations
  end
end
