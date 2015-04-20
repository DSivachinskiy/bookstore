require 'rails_helper'

RSpec.describe BillingAdressesController, type: :controller do
  let(:costumer) { FactoryGirl.create(:costumer) }
  let(:country) { FactoryGirl.create(:country) }
  let(:adress_params) { FactoryGirl.attributes_for(:billing_adress).stringify_keys }
  let(:billing_adress) { FactoryGirl.create(:billing_adress, costumer: costumer, country: country) }
  
  before do
    create_ability!
    controller.stub(:current_costumer).and_return costumer
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe 'POST #create' do

    context 'with valid attributes' do
      before do
        billing_adress.stub(:save).and_return true
      end

      it 'redirects to back' do
        post :create, billing_adress: adress_params
        expect(response).to redirect_to("where_i_came_from")
      end

      it 'sends notice' do
        post :create, billing_adress: adress_params
        expect(flash[:notice]).to have_content 'Billing adress succesfully created!'
      end
    end

    context 'with invalid attributes' do
      before do
        billing_adress.stub(:save).and_return false
      end

      it 'redirects to back' do
        post :create, billing_adress: adress_params
        expect(response).to redirect_to("where_i_came_from")
      end
    end
  end


  describe 'PUT #update' do
  
    
    context 'with valid attributes' do
      before do

        
        costumer.stub(:billing_adress).and_return billing_adress
        billing_adress.stub(:update_attributes).and_return true
      end

      it 'redirects to back' do
        put :update, id: billing_adress.id, billing_adress: adress_params
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends notice' do
         put :update, id: billing_adress.id, billing_adress: adress_params
        expect(flash[:notice]).to have_content 'Billing adress succesfully updated!'
      end
    end

    context 'with invalid attributes' do
      before do
        
        costumer.stub(:billing_adress).and_return billing_adress
        billing_adress.stub(:update).and_return false
        put :update, id: billing_adress.id, billing_adress: adress_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends alert' do
        expect(flash[:notice]).to eq('Wrong filled fields!')
      end
    end
  end
=begin
    context 'cancan doesnt allow :update' do
      before do
        @ability.cannot :update, BillingAddress
        put :update, id: billing_address.id, billing_address: address_params
      end

      it 'redirect to main page' do
        expect(response).to redirect_to('/?locale=en')
      end

      it 'sends flash error' do
        expect(flash[:alert]).to have_content 'Access denied'
      end
    end
  end
=end
end