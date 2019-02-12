class CreateFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :followings do |t|
      t.integer :follower_user_id
      t.integer :following_user_id
      t.timestamps
    end
  end
end
