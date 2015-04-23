require 'features/features_spec_helper'
require 'rails_helper'
feature 'Checkout delivery page' do
  given!(:costumer) { FactoryGirl.create(:costumer) }
  given!(:author) { FactoryGirl.create(:author) }
  given!(:category) { FactoryGirl.create(:category) }
  given!(:book) { FactoryGirl.create(:book, author: author, category: category) }
  given(:order) { FactoryGirl.create(:order, costumer: costumer) }
  given!(:order_item) { FactoryGirl.create(:order_item, order: order, book: book) }
  given!(:coupon) { FactoryGirl.create(:coupon) }

  background do
    login_as costumer, scope: :costumer
    visit delivery_checkout_path
  end  

  context 'Adding delivery options' do
	  scenario 'Add ground ups' do
	    within('.order') do
	    
	    choose 'radio_5'
	    click_button 'Зберегти'
	  end
	    expect(page).to have_content('+ 5')
	  end

	  scenario 'Add two-day ups' do
	    within('.order') do
	    
	    choose 'radio_10'
	    click_button 'Зберегти'
	  end
	    expect(page).to have_content('+ 10')
	  end

	  scenario 'Add one-day ups' do
	    within('.order') do
	    
	    choose 'radio_15'
	    click_button 'Зберегти'
	  end
	    expect(page).to have_content('+ 15')
	  end
  end
end