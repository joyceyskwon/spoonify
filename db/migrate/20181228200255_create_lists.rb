class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_name
      t.integer :num_of_followers
      t.integer :num_of_items

      t.timestamps
    end
  end
end
