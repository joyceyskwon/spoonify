class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :restaurant_id
      t.datetime :date_time
      t.integer :num_of_people

      t.timestamps
    end
  end
end
