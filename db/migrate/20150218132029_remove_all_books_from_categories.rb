class RemoveAllBooksFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :all_books, :string
  end
end
