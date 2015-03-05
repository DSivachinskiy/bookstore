class AddRoleToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :role, :string
  end
end
