class Restaurant < ApplicationRecord
  has_many :restlists
  has_many :lists, through: :restlists
end
