class ChangeTweetsToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :tweets, :posts
  end
end
