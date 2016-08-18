class AddBairroToRecos < ActiveRecord::Migration
  def change
    add_column :recos, :bairro, :string
  end
end
