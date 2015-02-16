class AddBookIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :book_id, :integer
  end
end
