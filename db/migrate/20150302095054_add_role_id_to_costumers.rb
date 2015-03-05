class AddRoleIdToCostumers < ActiveRecord::Migration
  def change
    add_column :costumers, :role_id, :integer
  end
end
