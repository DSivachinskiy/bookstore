require 'features/features_spec_helper'
require 'rails_helper'
feature 'admin actions' do
  given!(:admin) { FactoryGirl.create(:admin) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }

  background do
    login_as admin, scope: :costumer
    visit books_path
  end 
  context 'new_book features' do
	  scenario 'redirect to new book page' do
	    click_link 'Нова книга'
	    expect(page).to have_content('Нова книга')
	    expect(page).to have_content('Назва книги')
	  end
	  
	  scenario 'Create book' do
	    click_link 'Нова книга'
	    within '#new_book' do
	      fill_in 'title_field', with: 'title'
	      fill_in 'description_field', with: 'description'
	      fill_in 'price_field', with: 222
	      fill_in 'stock_field', with: 111
	      click_button 'Створити'
	    end	
	    expect(page).to have_content('Книга успішно створена!')
	  end

	  scenario 'wrong filled fields during creation' do
	    click_link 'Нова книга'
	    within '#new_book' do
	      fill_in 'title_field', with: ''
	      click_button 'Створити'
	    end	
	    expect(page).to have_content('Невірно заповнені поля!')
	  end
  end
  context 'new_category features' do
    scenario 'redirect to new category page' do
	    click_link 'Нова категорія'
	    expect(page).to have_content('Нова категорія')
	    expect(page).to have_content('Назва')
	  end
	  
	  scenario 'Create book' do
	    click_link 'Нова категорія'
	    within '#new_category' do
	      fill_in 'title_field', with: 'title'
	      click_button 'Створити'
	    end	
	    expect(page).to have_content('Категорія успішно створена!')
	  end

	  scenario 'wrong filled fields during creation' do
	    click_link 'Нова категорія'
	    within '#new_category' do
	      fill_in 'title_field', with: ''
	      click_button 'Створити'
	    end	
	    expect(page).to have_content('Невірно заповнені поля!')
	  end
  end
end