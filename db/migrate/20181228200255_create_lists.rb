class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.string :list_name
      t.boolean :public
      # t.integer :num_of_followers
      # t.integer :num_of_items

      t.timestamps
    end
  end
end
