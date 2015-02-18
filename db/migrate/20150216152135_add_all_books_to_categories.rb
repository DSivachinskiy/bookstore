class AddAllBooksToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :all_books, :string
  end
end
