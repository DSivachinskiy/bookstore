FactoryGirl.define do

  factory :costumer do
    email      Faker::Internet.email
    password   Faker::Internet.password(8)
    firstname Faker::Name.first_name
    lastname  Faker::Name.last_name

    factory :admin do
      admin true
    end
  end

  factory :author do
    firstname  'author_firstname'
    lastname   'author_lastname'
    biography 'author_bio'
  end

  factory :category do
    title 'test_category'
  end

  factory :country do
    name Faker::Address.country
  end

  factory :book do
    title        'booktest'
    description  'test_description'
    author
    category
    price          1111
    books_in_stock 22
  
  end

  factory :credit_card do
    number '12345678901234'
    cvv 111
    expiration_month 12
    expiration_year 2111
    costumer

  end

  factory :order do
  end



  factory :billing_address do
    address Faker::Address.street_address
    zipcode Faker::Address.zip
    city    Faker::Address.city
    phone   Faker::PhoneNumber.cell_phone
    country
    costumer

  end

  factory :address do
    address Faker::Address.street_address
    zipcode Faker::Address.zip
    city    Faker::Address.city
    phone   Faker::PhoneNumber.cell_phone
    country
    costumer
  end

  factory :order_item do
    quantity
    order
    book
  end

  factory :coupon do
    number '111111'
    price 1
  end
end