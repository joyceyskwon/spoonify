class List < ApplicationRecord
  has_many :follows
  has_many :restlists
  has_many :users, through: :follows
  has_many :restaurants, through: :restlists
end
