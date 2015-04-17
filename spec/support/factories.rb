FactoryGirl.define do

  factory :costumer do
    email      Faker::Internet.email
    password   Faker::Internet.password(8)
    firstname Faker::Name.first_name
    lastname  Faker::Name.last_name
    admin false

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
    name 'test_country'
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



  factory :billing_adress do
    adress 111
    zipcode 222
    city    333
    phone   444
    shipping false
    country 
    costumer

  end

  factory :adress do
    adress Faker::Address.street_address
    zipcode Faker::Address.zip
    city    Faker::Address.city
    phone   Faker::PhoneNumber.cell_phone
    country
    costumer
  end

  factory :order_item do
    quantity 3
    order
    book
  end

  factory :coupon do
    number '123123'
    price 15
  end
end