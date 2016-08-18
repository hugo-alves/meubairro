class AddUserIdToRecos < ActiveRecord::Migration
  def change
    add_column :recos, :user_id, :integer
  end
end
