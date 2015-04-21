require 'rails_helper'

RSpec.describe AdressesController, type: :controller do
  let(:costumer) { FactoryGirl.create(:costumer) }
  let(:country) { FactoryGirl.create(:country) }
  let(:adress_params) { FactoryGirl.attributes_for(:adress).stringify_keys }
  
  
  before do
    create_ability!
    controller.stub(:current_costumer).and_return costumer
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe 'POST #create' do
    let(:adress) { FactoryGirl.build_stubbed(:adress, costumer: costumer, country: country) }
    context 'with valid attributes' do
      before do
        adress.stub(:save).and_return true
      end

      it 'redirects to back' do
        post :create, adress: adress_params
        expect(response).to redirect_to("where_i_came_from")
      end

      it 'sends notice' do
        post :create, adress: adress_params
        expect(flash[:notice]).to have_content 'Shipping adress succesfully created!'
      end
    end

    context 'with invalid attributes' do
      before do
        Adress.any_instance.stub(:save).and_return(false)
      end

      it 'redirects to back' do
        post :create, adress: adress_params
        expect(response).to redirect_to("where_i_came_from")
      end
      it 'sends notice' do
        post :create, adress: adress_params
        expect(flash[:notice]).to have_content 'Wrong filled fields!'
      end
    end
  end


  describe 'PUT #update' do
    let(:adress) { FactoryGirl.create(:adress, costumer: costumer, country: country) }
    
    context 'with valid attributes' do
      before do
        costumer.stub(:adress).and_return adress
        
        Adress.any_instance.stub(:update).and_return(true)
      end

      it 'redirects to back' do
        put :update, id: adress.id, adress: adress_params
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends notice' do
         put :update, id: adress.id, adress: adress_params
        expect(flash[:notice]).to have_content 'Shipping adress succesfully updated!'
      end
    end

    context 'with invalid attributes' do
      before do
        costumer.stub(:adress).and_return adress
        Adress.any_instance.stub(:update).and_return(false)
        
      end

      it 'redirects to back' do
        put :update, id: adress.id, adress: adress_params
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends alert' do
        put :update, id: adress.id, adress: adress_params
       expect(flash[:notice]).to eq('Wrong filled fields!')
      end
    end
  
    context 'cancan doesnt allow :update' do
      before do
        @ability.cannot :update, Adress
        put :update, id: adress.id, adress: adress_params
      end

      it 'redirect to main page' do
        expect(response).to redirect_to('/?locale=uk')
      end
    end
  end
end