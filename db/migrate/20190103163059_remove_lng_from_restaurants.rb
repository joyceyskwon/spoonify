class RemoveLngFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :lng, :decimal
  end
end
