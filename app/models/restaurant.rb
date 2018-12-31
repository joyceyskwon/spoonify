class Restaurant < ApplicationRecord
  has_many :restlists
  has_many :lists, through: :restlists

  validates :list_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :yelp_url, presence: true
  validates :yelp_url, uniqueness: true
end
