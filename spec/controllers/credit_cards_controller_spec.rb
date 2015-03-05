require 'rails_helper'
 
describe CreditCardsController do
 
  describe 'GET new' do
     let(:credit_card) { mock_model("CreditCard").as_new_record }
     before do
      CreditCard.stub(:new).and_return(credit_card)
      get :new
    end
 
    it 'assigns @credit_card variable' do
      expect(assigns[:credit_card]).to eq(credit_card)
    end
 
    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

describe "PUT update" do
  let(:attr) do 
    { :number => 321 }
  end
  
  
  before(:each) do
    sign_in FactoryGirl.create(:costumer)
    @credit_card = CreditCard.create(number: 123, cvv: 111, expiration_month: Date.today.month, expiration_year: Date.today.year, firstname: 'Johnny', lastname: 'Ring')
    put :update, :id => @credit_card.id, :credit_card => attr
    @credit_card.reload
  end

  it { expect(@credit_card.number).to eql attr[:number] }
  
end


end