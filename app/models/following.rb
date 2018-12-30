class Following < ApplicationRecord

  belongs_to :followed, class_name: "User", optional: true
  belongs_to :follower, class_name: "User", optional: true

  # validates :followed_id, presence: true
  # validates :follower_id, presence: true
  #
  validate :realizm

  private

  def realizm
    return unless followed_id == follower_id
    errors.add :followed_id, 'Only a solipsist would follow themselves'
  end

end # end of Following class
