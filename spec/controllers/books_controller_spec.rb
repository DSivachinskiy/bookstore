require 'rails_helper'
 
describe BooksController do
 
  describe 'GET new' do
     let(:book) { mock_model("Book").as_new_record }
     before do
      Book.stub(:new).and_return(book)
      get :new
    end
 
    it 'assigns @book variable' do
      expect(assigns[:book]).to eq(book)
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
    @book = Book.create(title: 'title', description: 'description', price: 123, books_in_stock: 12, author_id: 2, category_id: 2)
    put :update, :id => @book.id, :book => attr
    @book.reload
  end

  it { expect(@book.title).to eql attr[:title] }
  
end


end