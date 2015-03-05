require 'rails_helper'
 
describe OrderItemsController do
 
  describe 'GET new' do
     let(:order_item) { mock_model("OrderItem").as_new_record }
     before do
      OrderItem.stub(:new).and_return(order_item)
      get :new
    end
 
    it 'assigns @order_item variable' do
      expect(assigns[:order_item]).to eq(order_item)
    end
 
    it 'renders new template' do
      expect(response).to render_template :new
    end
  end
=begin
describe "PUT update" do
  let(:attr) do 
    { :quantity => 1 }
  end
  
  
  before(:each) do
    sign_in FactoryGirl.create(:costumer)
    order1 = Order.create(order_status_id: 1, )
    book1 = Book.create(title: 'title', books_in_stock: 10, price: 123)
    @order_item = OrderItem.create(quantity: 10, book: book1, order: order1)
    put :update, :id => @order_item.id, :order_item => attr
    @order_item.reload
  end

  it { expect(@order_item.quantity).to eql attr[:quantity] }
  
end

=end
end