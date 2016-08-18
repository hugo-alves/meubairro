class CreateRecos < ActiveRecord::Migration
  def change
    create_table :recos do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
