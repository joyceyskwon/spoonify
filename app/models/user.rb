class User < ApplicationRecord
  has_secure_password

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
  has_many :lists
  has_many :reservations
  has_many :restaurants, through: :reservations

  has_many :following_users, foreign_key: :followed_id, class_name: 'Following'
  has_many :followers, through: :following_users

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, through: :followed_users

  validates :username, presence: true
  validates :username, uniqueness: true

  def following?(other_user)
    followed_users.find_by_followed_id(other_user.id)
  end

  def followed_users?(other_user)
    followed_users.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    followed_users.create(followed_id: other_user.id) unless following?(other_user)
  end

  def unfollow!(other_user)
    followed_users.find_by_followed_id(other_user.id).destroy
  end

end # end of User class
