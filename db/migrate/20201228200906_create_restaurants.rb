class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :about

      t.timestamps
    end
  end
end
