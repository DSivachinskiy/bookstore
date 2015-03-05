require 'rails_helper'
 
describe AdressesController do
 
  describe 'GET new' do
     let(:adress) { mock_model("Adress").as_new_record }
     before do
      Adress.stub(:new).and_return(adress)
      get :new
    end
 
    it 'assigns @adress variable' do
      expect(assigns[:adress]).to eq(adress)
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
    @adress = Adress.create(adress: 'adress', zipcode: 123, city: 'city', phone: 312, country_id: 2)
    put :update, :id => @adress.id, :adress => attr
    @adress.reload
  end

  it { expect(@adress.adress).to eql attr[:adress] }
  
end


end