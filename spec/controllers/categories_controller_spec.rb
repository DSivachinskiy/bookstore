require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:costumer) { FactoryGirl.create(:costumer) }
  
  let(:category_params) { FactoryGirl.attributes_for(:category).stringify_keys }
  
  
  before do
    create_ability!
    controller.stub(:current_costumer).and_return costumer
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe 'POST #create' do
    let(:category) { FactoryGirl.build_stubbed(:category) }
    context 'with valid attributes' do
      before do
        category.stub(:save).and_return true
        post :create, category: category_params
      end

      it 'redirects to books_path' do
        expect(response).to redirect_to("#{books_path}?locale=uk")
      end

      it 'sends notice' do
        expect(flash[:notice]).to have_content 'Категорія успішно створена!'
      end
    end

    context 'with invalid attributes' do
      before do
        Category.any_instance.stub(:save).and_return(false)
        post :create, category: category_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to("where_i_came_from")
      end

      it 'sends alert' do
        expect(flash[:alert]).to have_content 'Невірно заповнені поля!'
      end
    end

  end


end