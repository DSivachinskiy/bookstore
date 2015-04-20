require 'rails_helper'
require 'capybara/rspec'

def billing_adress_fill
  within('#new_billing_adress') do
    fill_in 'billing_adress_adress', with: 111
    fill_in 'billing_adress_zipcode', with: 222
    fill_in 'billing_adress_city', with: 333
    fill_in 'billing_adress_phone', with: 444
    click_button 'Створити'
  end
end

def shipping_adress_fill
  within('#new_adress') do
    fill_in 'shipping_adress_adress', with: 111
    fill_in 'shipping_adress_zipcode', with: 222
    fill_in 'shipping_adress_city', with: 333
    fill_in 'shipping_adress_phone', with: 444
    click_button 'Створити'
  end
end
def billing_adress_wrong_fill
  within('#new_billing_adress') do
    fill_in 'billing_adress_adress', with: ''
    fill_in 'billing_adress_zipcode', with: ''
    fill_in 'billing_adress_city', with: ''
    fill_in 'billing_adress_phone', with: ''
    click_button 'Створити'
  end
end

def shipping_adress_wrong_fill
  within('#new_adress') do
    fill_in 'shipping_adress_adress', with: ''
    fill_in 'shipping_adress_zipcode', with: ''
    fill_in 'shipping_adress_city', with: ''
    fill_in 'shipping_adress_phone', with: ''
    click_button 'Створити'
  end
end

def billing_adress_check_fill
  within('#new_billing_adress') do
    fill_in 'billing_adress_adress', with: 111
    fill_in 'billing_adress_zipcode', with: 222
    fill_in 'billing_adress_city', with: 333
    fill_in 'billing_adress_phone', with: 444
    check 'checkbox'
    click_button 'Створити'
  end
end

def credit_card_fill
  within('#new_credit_card') do
    fill_in 'credit_card_number', with: 111
    fill_in 'credit_card_cvv', with: 222
    fill_in 'credit_card_month', with: 333
    fill_in 'credit_card_year', with: 444
    fill_in 'credit_card_firstname', with: 444
    fill_in 'credit_card_lastname', with: 444
    click_button 'Створити'
  end
end

def credit_card_wrong_fill
  within('#new_credit_card') do
    fill_in 'credit_card_number', with: ''
    fill_in 'credit_card_cvv', with: ''
    fill_in 'credit_card_month', with: ''
    fill_in 'credit_card_year', with: ''
    fill_in 'credit_card_firstname', with: ''
    fill_in 'credit_card_lastname', with: ''
    click_button 'Створити'
  end
end