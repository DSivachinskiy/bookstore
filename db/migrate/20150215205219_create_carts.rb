class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :costumer_id

      t.timestamps
    end
  end
end
