require 'features/features_spec_helper'
require 'rails_helper'
feature 'Changing settings' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:country) { FactoryGirl.create(:country) }

  background do
    login_as costumer, scope: :costumer
    visit costumer_path(costumer)
  end  

  scenario 'Add new billing_adress' do
    
    within('#new_billing_adress') do
      fill_in 'billing_adress_adress', with: 111
      fill_in 'billing_adress_zipcode', with: 222
      fill_in 'billing_adress_city', with: 333
      fill_in 'billing_adress_phone', with: 444
      click_button 'Створити'
    end

    expect(page).to have_content('Billing adress succesfully created!')
   
  end

  scenario 'wrong filled new billing_adress' do
    
    within('#new_billing_adress') do
      fill_in 'billing_adress_adress', with: ''
      fill_in 'billing_adress_zipcode', with: ''
      fill_in 'billing_adress_city', with: ''
      fill_in 'billing_adress_phone', with: ''
      click_button 'Створити'
    end

    expect(page).to have_content('Wrong filled fields!')
   
  end

  scenario 'update billing_address' do
    within('#new_billing_adress') do
      fill_in 'billing_adress_adress', with: 111
      fill_in 'billing_adress_zipcode', with: 222
      fill_in 'billing_adress_city', with: 333
      fill_in 'billing_adress_phone', with: 444
      click_button 'Створити'
    end
      within('.billing_adress') do
        fill_in 'billing_adress_adress', with: 777
        click_button 'Зберегти'
      end  
    
    expect(page).to have_content('Billing adress succesfully updated!')
  end

  scenario 'wrong filled update billing_address' do
    within('#new_billing_adress') do
      fill_in 'billing_adress_adress', with: 111
      fill_in 'billing_adress_zipcode', with: 222
      fill_in 'billing_adress_city', with: 333
      fill_in 'billing_adress_phone', with: 444
      click_button 'Створити'
    end
      within('.billing_adress') do
        fill_in 'billing_adress_adress', with: ''
        click_button 'Зберегти'
      end  
    
    expect(page).to have_content('Wrong filled fields!')
  end

   scenario 'Add new shipping_adress' do
    
    within('#new_adress') do
      fill_in 'shipping_adress_adress', with: 111
      fill_in 'shipping_adress_zipcode', with: 222
      fill_in 'shipping_adress_city', with: 333
      fill_in 'shipping_adress_phone', with: 444
      click_button 'Створити'
    end

    expect(page).to have_content('Shipping adress succesfully created!')
   
  end

  scenario 'wrong filled new shipping_adress' do
    
    within('#new_adress') do
      fill_in 'shipping_adress_adress', with: ''
      fill_in 'shipping_adress_zipcode', with: ''
      fill_in 'shipping_adress_city', with: ''
      fill_in 'shipping_adress_phone', with: ''
      click_button 'Створити'
    end

    expect(page).to have_content('Wrong filled fields!')
   
  end

  scenario 'update shipping_address' do
    within('#new_adress') do
      fill_in 'shipping_adress_adress', with: 111
      fill_in 'shipping_adress_zipcode', with: 222
      fill_in 'shipping_adress_city', with: 333
      fill_in 'shipping_adress_phone', with: 444
      click_button 'Створити'
    end
      within('.shipping_adress') do
        fill_in 'shipping_adress_adress', with: 777
        click_button 'Зберегти'
      end  
    
    expect(page).to have_content('Shipping adress succesfully updated!')
  end

  scenario 'wrong filled update shipping_address' do
    within('#new_adress') do
      fill_in 'shipping_adress_adress', with: 111
      fill_in 'shipping_adress_zipcode', with: 222
      fill_in 'shipping_adress_city', with: 333
      fill_in 'shipping_adress_phone', with: 444
      click_button 'Створити'
    end
      within('.shipping_adress') do
        fill_in 'shipping_adress_adress', with: ''
        click_button 'Зберегти'
      end  
    
    expect(page).to have_content('Wrong filled fields!')
  end

  scenario 'Add new billing_adress and the same shipping_adress' do
    
    within('#new_billing_adress') do
      fill_in 'billing_adress_adress', with: 111
      fill_in 'billing_adress_zipcode', with: 222
      fill_in 'billing_adress_city', with: 333
      fill_in 'billing_adress_phone', with: 444
      check 'checkbox'
      click_button 'Створити'
    end

    expect(page).to have_content(111)
    expect(page).to have_content(222)
    expect(page).to have_content(333)
    expect(page).to have_content(444)
    expect(page).to have_content('test_country')
  end

  scenario 'Add new credit_card' do
    
    within('#new_credit_card') do
      fill_in 'credit_card_number', with: 111
      fill_in 'credit_card_cvv', with: 222
      fill_in 'credit_card_month', with: 333
      fill_in 'credit_card_year', with: 444
      fill_in 'credit_card_firstname', with: 444
      fill_in 'credit_card_lastname', with: 444
      click_button 'Створити'
    end

    expect(page).to have_content('Credit card succesfully created!')
   
  end

   scenario 'wrong filled new credit_card' do
    
    within('#new_credit_card') do
      fill_in 'credit_card_number', with: ''
      fill_in 'credit_card_cvv', with: ''
      fill_in 'credit_card_month', with: ''
      fill_in 'credit_card_year', with: ''
      fill_in 'credit_card_firstname', with: ''
      fill_in 'credit_card_lastname', with: ''
      click_button 'Створити'
    end

    expect(page).to have_content('Wrong filled fields!')
   
  end

  scenario 'update credit_card' do
    
    within('#new_credit_card') do
      fill_in 'credit_card_number', with: 111
      fill_in 'credit_card_cvv', with: 222
      fill_in 'credit_card_month', with: 333
      fill_in 'credit_card_year', with: 444
      fill_in 'credit_card_firstname', with: 444
      fill_in 'credit_card_lastname', with: 444
      click_button 'Створити'
    end
    within('.credit_card') do
        fill_in 'credit_card_number', with: 777
        click_button 'Зберегти'
      end  
    expect(page).to have_content('Credit card succesfully updated!')
   
  end

  scenario 'wrong filled update credit_card' do
    
    within('#new_credit_card') do
      fill_in 'credit_card_number', with: 111
      fill_in 'credit_card_cvv', with: 222
      fill_in 'credit_card_month', with: 333
      fill_in 'credit_card_year', with: 444
      fill_in 'credit_card_firstname', with: 444
      fill_in 'credit_card_lastname', with: 444
      click_button 'Створити'
    end
    within('.credit_card') do
        fill_in 'credit_card_cvv', with: ''
        click_button 'Зберегти'
      end  
    expect(page).to have_content('Wrong filled fields!')
   
  end
end