class User < ApplicationRecord
  has_many :follows
  has_many :lists, through: :follows
end
