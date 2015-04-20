require 'features/features_spec_helper'
require 'rails_helper'
feature 'Checkout payment page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  
  background do
    login_as costumer, scope: :costumer
    visit costumer_path(costumer)
  end 

  scenario 'Add new credit_card' do
    credit_card_fill
    expect(page).to have_content('Credit card succesfully created!')
  end

  scenario 'wrong filled new credit_card' do
    credit_card_wrong_fill
    expect(page).to have_content('Wrong filled fields!')
  end

  scenario 'update credit_card' do
    credit_card_fill
    within('.credit_card') do
      fill_in 'credit_card_number', with: 777
      click_button 'Зберегти'
    end  
    expect(page).to have_content('Credit card succesfully updated!')
   
  end

  scenario 'wrong filled update credit_card' do
    credit_card_fill
    within('.credit_card') do
      fill_in 'credit_card_cvv', with: ''
      click_button 'Зберегти'
    end  
    expect(page).to have_content('Wrong filled fields!')
   
  end
end