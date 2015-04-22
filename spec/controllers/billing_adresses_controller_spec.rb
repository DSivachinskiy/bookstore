require 'rails_helper'
 
RSpec.describe BillingAdressesController, type: :controller do
  let(:costumer) { FactoryGirl.create(:costumer) }
  let(:country) { FactoryGirl.create(:country) }
  let(:adress_params) { FactoryGirl.attributes_for(:billing_adress).stringify_keys }
  
  
  before do
    create_ability!
    controller.stub(:current_costumer).and_return costumer
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe 'POST #create' do
    let(:billing_adress) { FactoryGirl.build_stubbed(:billing_adress, costumer: costumer, country: country) }
    context 'with valid attributes' do
      before do
        billing_adress.stub(:save).and_return true
        post :create, billing_adress: adress_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to("where_i_came_from")
      end

      it 'sends notice' do
        expect(flash[:notice]).to have_content 'Адреса платника успішно створена!'
      end
    end

    context 'with invalid attributes' do
      before do
        BillingAdress.any_instance.stub(:save).and_return(false)
        post :create, billing_adress: adress_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to("where_i_came_from")
      end
      it 'sends alert' do
        expect(flash[:alert]).to have_content 'Невірно заповнені поля!'
      end
    end
  end


  describe 'PUT #update' do
    let(:billing_adress) { FactoryGirl.create(:billing_adress, costumer: costumer, country: country) }
    
    context 'with valid attributes' do
      before do
        costumer.stub(:billing_adress).and_return billing_adress
        BillingAdress.any_instance.stub(:update).and_return(true)
        put :update, id: billing_adress.id, billing_adress: adress_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends notice' do
        expect(flash[:notice]).to have_content 'Адреса платника успішно оновлена!'
      end
    end

    context 'with invalid attributes' do
      before do
        costumer.stub(:billing_adress).and_return billing_adress
        BillingAdress.any_instance.stub(:update).and_return(false)
        put :update, id: billing_adress.id, billing_adress: adress_params
      end

      it 'redirects to back' do
        expect(response).to redirect_to('where_i_came_from')
      end

       it 'sends alert' do
       expect(flash[:alert]).to eq('Невірно заповнені поля!')
      end
    end
  
    context 'cancan doesnt allow :update' do
      before do
        @ability.cannot :update, BillingAdress
        put :update, id: billing_adress.id, billing_adress: adress_params
      end

      it 'redirect to main page' do
        expect(response).to redirect_to('/?locale=uk')
      end
    end
  end
end