require 'rails_helper'
 
describe OrderItem do
  let(:order_item) { OrderItem.new }
 
  it { expect(order_item).to validate_presence_of(:quantity) }
  
  it { should belong_to :book }
  it { should belong_to :order }
  
  it "calculates price" do
   order1 = Order.new
   book1 = Book.new(title: "book", price: 10, books_in_stock: 10)
   order_item1 = OrderItem.create(quantity: 10, book: book1, order: order1)
   expect(order_item1.price).to eq(100)
  end

end