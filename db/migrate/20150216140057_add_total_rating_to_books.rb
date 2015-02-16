class AddTotalRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :total_rating, :float
  end
end
