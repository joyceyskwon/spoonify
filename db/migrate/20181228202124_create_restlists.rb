class CreateRestlists < ActiveRecord::Migration[5.2]
  def change
    create_table :restlists do |t|
      t.integer :list_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
