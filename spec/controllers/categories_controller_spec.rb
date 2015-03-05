require 'rails_helper'
 
describe CategoriesController do
 
  describe 'GET new' do
     let(:category) { mock_model("Category").as_new_record }
     before do
     Category.stub(:new).and_return(category)
      get :new
    end
 
    it 'assigns @category variable' do
      expect(assigns[:category]).to eq(category)
    end
 
    it 'renders new template' do
      expect(response).to render_template :new
    end
  end

describe "PUT update" do
  let(:attr) do 
    { :title => 'new title' }
  end
  
  
  before(:each) do
    sign_in FactoryGirl.create(:costumer)
    @category = Category.create(title: 'title')
    put :update, :id => @category.id, :category => attr
    @category.reload
  end

  it { expect(@category.title).to eql attr[:title] }
  
end


end