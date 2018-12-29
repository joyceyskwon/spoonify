class User < ApplicationRecord
  has_secure_password

  has_many :follows
  has_many :lists, through: :follows

  validates :username, presence: true
  validates :username, uniqueness: true

  # def password
  #   @password_digest
  # end
  #
  # def password=(pt_pw)
  #   self.password_digest = BCrypt::Password.create(pt_pw)
  # end
  #
  # def authenticate(pt_pw)
  #   BCrypt::Password.new(self.password_digest) == pt_pw
  # end

end # end of User class
