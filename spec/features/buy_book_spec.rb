require 'features/features_spec_helper'

feature 'Add books to cart' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order) }
  
  scenario 'A user adds book to cart successfully from book show' do
    visit book_path(book)
    within('#new_order_item') do
      fill_in 'Quantity', with: 3
      click_button 'Створити'
    end

   
    expect(page).to have_content("Нинішнє замовлення (3)")
  end

end