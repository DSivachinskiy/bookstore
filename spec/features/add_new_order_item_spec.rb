require 'features/features_spec_helper'
require 'rails_helper'
feature 'Add new order item to current order' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order) }
  
  background do
    login_as costumer, scope: :costumer
    visit book_path(book)
  end  
  scenario 'A user adds book to cart successfully from book show' do
    within('#new_order_item') do
      fill_in 'new_oi', with: 4
      click_button 'Додати до замовлення'
    end
    expect(page).to have_content("Нинішнє замовлення (4)")
    expect(page).to have_content(4444)
  end

  scenario 'wrong added order item' do
    within('#new_order_item') do
      fill_in 'new_oi', with: ''
      click_button 'Додати до замовлення'
    end
    expect(page).to have_content("Щось не вірно!")

  end

end