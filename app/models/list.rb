class List < ApplicationRecord
  belongs_to :user
  has_many :restlists
  has_many :restaurants, through: :restlists
end
