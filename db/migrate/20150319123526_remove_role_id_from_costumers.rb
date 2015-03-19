class RemoveRoleIdFromCostumers < ActiveRecord::Migration
  def change
    remove_column :costumers, :role_id, :integer
  end
end
