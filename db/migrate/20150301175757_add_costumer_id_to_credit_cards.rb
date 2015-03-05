class AddCostumerIdToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :costumer_id, :integer
  end
end
