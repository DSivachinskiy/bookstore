class AddRatingIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rating_id, :integer
  end
end
