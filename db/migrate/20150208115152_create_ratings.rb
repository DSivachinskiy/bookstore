class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.text :texxt_review
      t.integer :rating_number

      t.timestamps
    end
  end
end
