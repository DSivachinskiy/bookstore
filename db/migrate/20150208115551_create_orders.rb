class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price
      t.date :completed_date
      t.string :state

      t.timestamps
    end
  end
end
