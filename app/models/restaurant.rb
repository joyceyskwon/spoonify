class Restaurant < ApplicationRecord
  belongs_to :list
  # has_many :restlists
  # has_many :lists, through: :restlists

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :yelp_url, presence: true
  validates :yelp_url, uniqueness: true
end
