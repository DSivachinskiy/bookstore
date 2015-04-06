class AddNumberToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :number, :integer
  end
end
