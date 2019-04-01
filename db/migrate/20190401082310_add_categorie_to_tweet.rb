class AddCategorieToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :category_id, :integer
    add_foreign_key :tweets, :categories
  end
end
