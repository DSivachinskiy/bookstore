class AddCostumerIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :costumer_id, :integer
  end
end
