require 'rails_helper'

RSpec.describe CreditCardsController, type: :controller do
  let(:costumer) { FactoryGirl.create(:costumer) }
  
  let(:card_params) { FactoryGirl.attributes_for(:credit_card).stringify_keys }
  
  
  before do
    create_ability!
    controller.stub(:current_costumer).and_return costumer
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe 'POST #create' do
    let(:credit_card) { FactoryGirl.build_stubbed(:credit_card, costumer: costumer) }
    context 'with valid attributes' do
      before do
        credit_card.stub(:save).and_return true
      end

      it 'redirects to back' do
        post :create, credit_card: card_params
        expect(response).to redirect_to("where_i_came_from")
      end

      it 'sends notice' do
        post :create, credit_card: card_params
        expect(flash[:notice]).to have_content 'Credit card succesfully created!'
      end
    end

    context 'with invalid attributes' do
      before do
        CreditCard.any_instance.stub(:save).and_return(false)
      end

      it 'redirects to back' do
        post :create, credit_card: card_params
        expect(response).to redirect_to("where_i_came_from")
      end
      it 'sends notice' do
        post :create, credit_card: card_params
        expect(flash[:notice]).to have_content 'Wrong filled fields!'
      end
    end
  end


  describe 'PUT #update' do
    let(:credit_card) { FactoryGirl.create(:credit_card, costumer: costumer) }
    
    context 'with valid attributes' do
      before do
        costumer.stub(:credit_card).and_return credit_card
        
        CreditCard.any_instance.stub(:update).and_return(true)
      end

      it 'redirects to back' do
        put :update, id: credit_card.id, credit_card: card_params
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends notice' do
         put :update, id: credit_card.id, credit_card: card_params
        expect(flash[:notice]).to have_content 'Credit card succesfully updated!'
      end
    end

    context 'with invalid attributes' do
      before do
        costumer.stub(:credit_card).and_return credit_card
        CreditCard.any_instance.stub(:update).and_return(false)
        
      end

      it 'redirects to back' do
        put :update, id: credit_card.id, credit_card: card_params
        expect(response).to redirect_to('where_i_came_from')
      end

      it 'sends alert' do
        put :update, id: credit_card.id, credit_card: card_params
       expect(flash[:notice]).to eq('Wrong filled fields!')
      end
    end
  
    context 'cancan doesnt allow :update' do
      before do
        @ability.cannot :update, CreditCard
        put :update, id: credit_card.id, credit_card: card_params
      end

      it 'redirect to main page' do
        expect(response).to redirect_to('/?locale=uk')
      end
    end
  end
end