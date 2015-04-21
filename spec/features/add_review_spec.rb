require 'features/features_spec_helper'
require 'rails_helper'
feature 'review' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order, costumer: costumer) }
  given!(:rating) { FactoryGirl.create(:rating, costumer: costumer, book: book) }

  background do
    login_as costumer, scope: :costumer
    visit book_path(book)
  end  

  scenario 'get new rating page' do
    click_link 'rating_link'
    expect(page).to have_content('Новий відгук для')
  end

  scenario 'new review and rating' do
    click_link 'rating_link'
    within('#new_rating') do
      fill_in 'title_field', with: 'test_title'
      fill_in 'review_field', with: 'test_review'
      click_button 'Створити'
    end
    expect(page).to have_content('test_title')
    expect(page).to have_content('test_review')
  end

  scenario 'find review' do
    
    expect(page).to have_content('review')
    expect(page).to have_content('title')
    expect(page).to have_content(4)
  end

  scenario 'destroy review' do
    click_link 'destroy_link'
    expect(page).not_to have_content('review')
    expect(page).not_to have_content('title')
    expect(page).not_to have_content(4)
  end

  scenario 'update review' do
    click_link 'update_link'
    within('.rating') do
      fill_in 'title_field', with: 'test_title22'
      fill_in 'review_field', with: 'test_review22'
      click_button 'Зберегти'
    end
    expect(page).to have_content('test_title22')
    expect(page).to have_content('test_review22')
  end
end