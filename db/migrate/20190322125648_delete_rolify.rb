class DeleteRolify < ActiveRecord::Migration[5.2]
  def change
    drop_table(:users_roles)
    drop_table(:roles)
  end
end
