class AddCostumerIdToAdresses < ActiveRecord::Migration
  def change
    add_column :adresses, :costumer_id, :integer
  end
end
