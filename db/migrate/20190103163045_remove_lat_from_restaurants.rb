class RemoveLatFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :lat, :decimal
  end
end
