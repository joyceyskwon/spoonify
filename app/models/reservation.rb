class Reservation < ApplicationRecord
  belongs_to :restaurant, optional: true

  validates :restaurant_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :num_of_people, presence: true
end
