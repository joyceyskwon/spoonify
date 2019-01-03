class List < ApplicationRecord
  belongs_to :user, optional: true
  has_many :restaurants
  # has_many :restlists
  # has_many :restaurants, through: :restlists

  validates :list_name, presence: true

end
