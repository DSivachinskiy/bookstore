require 'rails_helper'
 
describe Order do
  let(:order) { Order.new }
 
  it { expect(order).to validate_presence_of(:costumer_id) }
  it { expect(order).to validate_presence_of(:completed_date) }
  
  it { should belong_to :credit_card }
  it { should belong_to :costumer }
  it { should belong_to :order_status }
  it { should belong_to :adress }
  it { should belong_to :billing_adress }
  it { should have_many :order_items }
=begin
  it "calculates total price" do
   
   costumer1 = Costumer.new
   card1 = CreditCard.new
   status1 = OrderStatus.new
   adress1 = Adress.new
   billing_adress1 = BillingAdress.new
   order_item1 = OrderItem.create(price: 10)
   order_item2 = OrderItem.create(price: 10)

   order1 = Order.create(order_items: [order_item1, order_item2], costumer: costumer1, credit_card: card1, 
   	order_status: status1, adress: adress1, billing_adress: billing_adress1, costumer_id: costumer1.id,
   	completed_date: Date.today)
   expect(order1.total_price).to eq(20)
  end
=end
end