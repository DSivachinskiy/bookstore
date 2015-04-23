require 'features/features_spec_helper'
require 'rails_helper'
feature 'Add new order item to current order' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  
  
  background do
    login_as costumer, scope: :costumer
    visit edit_costumer_registration_path
  end  
  scenario 'User is changing password' do
    within('.user') do
      fill_in 'password', with: '11111111'
      fill_in 'password_confirmation', with: '11111111'
      fill_in 'current_password', with: 'qqqqqqqq'
      click_button 'Зберегти'
    end
    expect(page).to have_content("Ви успішно оновили ваш обліковий запис.") 
  end
  
end