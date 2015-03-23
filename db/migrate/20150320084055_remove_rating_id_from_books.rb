class RemoveRatingIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :rating_id, :integer
  end
end
