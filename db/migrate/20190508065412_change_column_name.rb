class ChangeColumnName < ActiveRecord::Migration[5.2]
  def up
    rename_column :posts, :tweet, :post
  end
end
