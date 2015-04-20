require 'features/features_spec_helper'
require 'rails_helper'
feature 'Checkout adress page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:country) { FactoryGirl.create(:country) }

  background do
    login_as costumer, scope: :costumer
    visit checkout_adress_path
  end  
  context 'billing_adress' do
    scenario 'Add new billing_adress' do
      billing_adress_fill
      expect(page).to have_content('Billing adress succesfully created!')
    end

    scenario 'wrong filled new billing_adress' do
      billing_adress_wrong_fill
      expect(page).to have_content('Wrong filled fields!')
    end

    scenario 'update billing_address' do
      billing_adress_fill
      within('.billing_adress') do
        fill_in 'billing_adress_adress', with: 777
        click_button 'Зберегти'
      end  
      
      expect(page).to have_content('Billing adress succesfully updated!')
    end

    scenario 'wrong filled update billing_address' do
      billing_adress_fill
      within('.billing_adress') do
        fill_in 'billing_adress_adress', with: ''
        click_button 'Зберегти'
      end  
      
      expect(page).to have_content('Wrong filled fields!')
    end

    scenario 'Add new billing_adress and the same shipping_adress' do
      billing_adress_check_fill
      expect(page).to have_content(111)
      expect(page).to have_content(222)
      expect(page).to have_content(333)
      expect(page).to have_content(444)
      expect(page).to have_content('test_country')
    end
  end

  context 'shipping_adress' do
    scenario 'Add new shipping_adress' do
      shipping_adress_fill
      expect(page).to have_content('Shipping adress succesfully created!')
    end

    scenario 'wrong filled new shipping_adress' do
      shipping_adress_wrong_fill
      expect(page).to have_content('Wrong filled fields!')
     
    end

    scenario 'update shipping_address' do
      shipping_adress_fill
      within('.shipping_adress') do
        fill_in 'shipping_adress_adress', with: 777
        click_button 'Зберегти'
      end  
      
      expect(page).to have_content('Shipping adress succesfully updated!')
    end

    scenario 'wrong filled update shipping_address' do
      shipping_adress_fill
      within('.shipping_adress') do
        fill_in 'shipping_adress_adress', with: ''
        click_button 'Зберегти'
      end  
      
      expect(page).to have_content('Wrong filled fields!')
    end
  end
end