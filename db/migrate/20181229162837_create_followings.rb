class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.belongs_to :followed
      t.belongs_to :follower
      # t.index [:followed_id, :follower_id], unique: true

      t.timestamps
    end
  end
end
