require 'features/features_spec_helper'
require 'rails_helper'
feature 'get 404 page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  background do
    login_as costumer, scope: :costumer
    visit '/err'
  end  
  scenario 'qwe' do
    expect(page).to have_content('The page you were looking for doesn\'t exist.')
  end
end  	