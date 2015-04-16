require 'features/features_spec_helper'
require 'rails_helper'

feature "Registration", :devise do
  scenario "Visitor registers successfully via register form" do
    visit new_costumer_registration_path
    within '#new_costumer' do
      fill_in 'Email', with: "johnny@mail.ru"
      fill_in 'Firstname', with: "Johnny"
      fill_in 'Lastname', with: "Ring"     
      fill_in'Password', with: '12345678'
      fill_in'Password confirmation', with: '12345678'
      click_button('Створити')
    end
    expect(page).to have_content 'Вийти'
    expect(page).to have_content 'Нинішнє замовлення'
    expect(page).to have_content 'Налаштування'
    expect(page).to have_content 'Мої замовлення'

    expect(page).not_to have_content 'Увійти'
    expect(page).not_to have_content 'Регістрація'
    
   

  end
 
end

