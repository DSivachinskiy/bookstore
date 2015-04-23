FactoryGirl.define do

  factory :costumer do
    email      "test@mail.ru"
    password   "qqqqqqqq"
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
    firstname 'test_firstname'
    lastname 'test_lastname'
    costumer

  end

  factory :order do
    ups 5
    costumer
  end



  factory :billing_adress do
    adress 'test_adress'
    zipcode 222
    city    'test_city'
    phone   444
    shipping false
    country 
    costumer

  end

  factory :adress do
    adress 'test_adress'
    zipcode 222
    city    'test_city'
    phone   444
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

  factory :rating do
    texxt_review 'review'
    rating_number 4
    title 'title'
    costumer
    book
  end
end