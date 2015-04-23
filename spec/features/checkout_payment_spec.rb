require 'features/features_spec_helper'
require 'rails_helper'
feature 'Checkout payment page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order, costumer: costumer) }
  given!(:order_item) { FactoryGirl.create(:order_item, order: order, book: book) }
  given!(:coupon) { FactoryGirl.create(:coupon) }
  
  background do
    login_as costumer, scope: :costumer
    visit payment_checkout_path
  end 

  scenario 'Add new credit_card' do
    credit_card_fill
    expect(page).to have_content('Кредитна картка успішно створена!')
  end

  scenario 'wrong filled new credit_card' do
    credit_card_wrong_fill
    expect(page).to have_content('Невірно заповнені поля!')
  end

  scenario 'update credit_card' do
    credit_card_fill
    within('.credit_card') do
      fill_in 'credit_card_number', with: 777
      click_button 'Зберегти'
    end  
    expect(page).to have_content('Кредитна картка успішно оновлена!')
   
  end

  scenario 'wrong filled update credit_card' do
    credit_card_fill
    within('.credit_card') do
      fill_in 'credit_card_cvv', with: ''
      click_button 'Зберегти'
    end  
    expect(page).to have_content('Невірно заповнені поля!')
   
  end
end