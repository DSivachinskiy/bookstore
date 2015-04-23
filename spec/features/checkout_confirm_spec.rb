require 'features/features_spec_helper'
require 'rails_helper'
feature 'Checkout confirm page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given!(:order) { FactoryGirl.create(:order, costumer: costumer) }
  given!(:order_item) { FactoryGirl.create(:order_item, order: order, book: book) }
  given!(:coupon) { FactoryGirl.create(:coupon) }
  given!(:country) { FactoryGirl.create(:country) }
  given!(:adress) { FactoryGirl.create(:adress, costumer: costumer, country: country) }
  given!(:billing_adress) { FactoryGirl.create(:billing_adress, costumer: costumer, country: country) }
  given!(:credit_card) { FactoryGirl.create(:credit_card, costumer: costumer) }

  background do
    login_as costumer, scope: :costumer
    visit confirm_checkout_path
  end  
  
  context 'page content' do
    scenario 'right billing_adress and shipping_adress content' do
      expect(page).to have_content('test_country')
      expect(page).to have_content('test_city')
      expect(page).to have_content('test_adress')
      expect(page).to have_content(222) #zipcode
      expect(page).to have_content(444) #phone
    end

    scenario 'right credit_card content' do
      expect(page).to have_content(12345678901234) #card_number
      expect(page).to have_content(12) #expiration_month
      expect(page).to have_content(2111) #expiration_year
      expect(page).to have_content('test_firstname')
      expect(page).to have_content('test_lastname')
      expect(page).to have_content(111) #cvv
    end
    
    scenario 'right ups content' do
      expect(page).to have_content('Наземна доставка')
      expect(page).to have_content('+ 5') #ups
    end
      
    scenario 'right order_item content' do
      expect(page).to have_content(1111) #book_price
      expect(page).to have_content(3333) #order_item_price
    end

    scenario 'accept_button present' do
      expect(page).to have_content('Підтвердження замовлення')
    end
  end

  context 'links and button actions' do
    scenario 'accept order' do
      click_button 'Підтвердження замовлення'
      expect(page).to have_content('Замовлення 1')
      expect(page).to have_content('Нинішнє замовлення (0)')
    end

    scenario 'edit shipping adress link click' do
      click_link 'adress_link'
      expect(page).to have_content('Адреса доставки')
    end

    scenario 'edit billing adress link click' do
      click_link 'adress_link2'
      expect(page).to have_content('Адреса платника')
    end

    scenario 'edit delivery link click' do
      click_link 'delivery_link'
      expect(page).to have_content('Наземна доставка (5)')
      expect(page).to have_content('Дводенна доставка (10)')
      expect(page).to have_content('Одноденна доставка (15)')
    end

    scenario 'edit payment click' do
      click_link 'payment_link'
      expect(page).to have_content('КРЕДИТНА КАРТКА')
    end
  end
  context 'accept order' do
    scenario 'complete page content' do
      click_button 'accept'
      expect(page).to have_content('test_country')
        expect(page).to have_content('test_city')
        expect(page).to have_content('test_adress')
        expect(page).to have_content(222) #zipcode
        expect(page).to have_content(444) #phone
        expect(page).to have_content(12345678901234) #card_number
        expect(page).to have_content(12) #expiration_month
        expect(page).to have_content(2111) #expiration_year
        expect(page).to have_content('test_firstname')
        expect(page).to have_content('test_lastname')
        expect(page).to have_content(111) #cvv
    end
  end
end