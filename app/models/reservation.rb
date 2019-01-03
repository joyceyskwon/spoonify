class Reservation < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :user, optional: true

  validates :restaurant_id, presence: true
  validates :date_time, presence: true
  validates :num_of_people, presence: true

end # end of ReservationsController
