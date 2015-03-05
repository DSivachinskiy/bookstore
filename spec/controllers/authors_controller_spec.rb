require 'rails_helper'
 
describe AuthorsController do
 
  describe 'GET new' do
     let(:author) { mock_model("Author").as_new_record }
     before do
      Author.stub(:new).and_return(author)
      get :new
    end
 
    it 'assigns @author variable' do
      expect(assigns[:author]).to eq(author)
    end
 
    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

describe "PUT update" do
  let(:attr) do 
    { :firstname => 'Bobby' }
  end
  
  
  before(:each) do
    sign_in FactoryGirl.create(:costumer)
    @author = Author.create(firstname: 'johnny', lastname: 'Deph', biography: 'bio')
    put :update, :id => @author.id, :author => attr
    @author.reload
  end

  it { expect(@author.firstname).to eql attr[:firstname] }
  
end


end