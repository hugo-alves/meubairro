class ChangeAddressToText < ActiveRecord::Migration
  def change
    change_column :recos, :address, :text
  end
end
