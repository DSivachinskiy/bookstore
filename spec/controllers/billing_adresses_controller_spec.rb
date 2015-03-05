require 'rails_helper'
 
describe BillingAdressesController do
 
  describe 'GET new' do
     let(:billing_adress) { mock_model("BillingAdress").as_new_record }
     before do
      BillingAdress.stub(:new).and_return(billing_adress)
      get :new
    end
 
    it 'assigns @billing_adress variable' do
      expect(assigns[:billing_adress]).to eq(billing_adress)
    end
 
    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

describe "PUT update" do
  let(:attr) do 
    { :adress => 'new adress' }
  end
  
  
  before(:each) do
    sign_in FactoryGirl.create(:costumer)
    @billing_adress = BillingAdress.create(adress: 'adress', zipcode: 123, city: 'city', phone: 312, country_id: 2)
    put :update, :id => @billing_adress.id, :billing_adress => attr
    @billing_adress.reload
  end

  it { expect(@billing_adress.adress).to eql attr[:adress] }
  
end


end