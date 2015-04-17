require 'features/features_spec_helper'
require 'rails_helper'
feature 'Changing current_order' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order, costumer: costumer) }
  given!(:order_item) { FactoryGirl.create(:order_item, order: order, book: book) }
  given!(:coupon) { FactoryGirl.create(:coupon) }

  background do
    login_as costumer, scope: :costumer
    visit edit_order_path(order)
  end  

  scenario 'Change quantity of order item' do
    
    within('.order_item') do
      fill_in 'quantity', with: 4
      click_button 'Зберегти'
    end

    expect(page).to have_content("Нинішнє замовлення (4)")
    expect(page).to have_content(4444)
  end

  scenario 'delete order item' do
    
    click_link 'delete_button'

    expect(page).to have_content("Нинішнє замовлення (0)")
  end

  scenario 'update coupon' do
    
    within('.coupon') do
      fill_in 'coupon_number', with: 123123
      click_button 'Купон'
    end

    expect(page).to have_content("- 15")
  end

  scenario 'delete current_order' do
    
    click_button 'Видалити'

    expect(page).to have_content("Нинішнє замовлення (0)")
  end

end