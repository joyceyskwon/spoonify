class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.integer :list_id
      t.string :name
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.string :yelp_url

      t.timestamps
    end
  end
end
