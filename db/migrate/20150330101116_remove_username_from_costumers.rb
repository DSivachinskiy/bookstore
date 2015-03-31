class RemoveUsernameFromCostumers < ActiveRecord::Migration
  def change
    remove_column :costumers, :username, :string
  end
end
