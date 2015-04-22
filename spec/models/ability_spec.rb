require 'rails_helper'
require 'cancan/matchers'

describe 'Costumer' do
  describe 'abilities' do
    context 'when costumer signed in as admin' do
      let(:admin) { FactoryGirl.create(:admin) }
      
      subject(:ability) { Ability.new(admin) }
   
      it { expect(ability).to be_able_to(:create, Book.new) }
      it { expect(ability).to be_able_to(:create, Category.new) }

    end
    context 'when costumer signed in as costumer' do
      let(:costumer) { FactoryGirl.create(:costumer) }
      let(:order) { FactoryGirl.create(:order, user_id: user.id) }

      subject(:ability) { Ability.new(costumer) }

      it { expect(ability).to be_able_to(:manage, Order.new(costumer_id: costumer.id)) }
      it { expect(ability).to be_able_to(:manage, OrderItem.new) }
      it { expect(ability).to be_able_to(:manage, costumer) }
      it { expect(ability).to be_able_to(:manage, Rating.new) }
      it { expect(ability).to be_able_to(:manage, BillingAdress.new(costumer_id: costumer.id)) }
      it { expect(ability).to be_able_to(:manage, Adress.new(costumer_id: costumer.id)) }
      it { expect(ability).to be_able_to(:update, CreditCard.new(costumer_id: costumer.id)) }

      it { expect(ability).not_to be_able_to(:manage, Book.new) }
      it { expect(ability).not_to be_able_to(:manage, Author.new) }
      it { expect(ability).not_to be_able_to(:manage, Category.new) }

    end
     context 'when user no login' do
      let(:costumer) { nil }
      subject(:ability) { Ability.new(costumer) }

      it { expect(ability).to be_able_to(:read, Book.new) }
      it { expect(ability).to be_able_to(:read, Author.new) } 
      it { expect(ability).to be_able_to(:read, Category.new) }

      it { expect(ability).not_to be_able_to(:manage, Order.new) }
      it { expect(ability).not_to be_able_to(:manage, OrderItem.new) }
      it { expect(ability).not_to be_able_to(:manage, Rating.new) }
      it { expect(ability).not_to be_able_to(:manage, BillingAdress.new) }
      it { expect(ability).not_to be_able_to(:manage, Adress.new) }
      it { expect(ability).not_to be_able_to(:update, CreditCard.new) }
      it { expect(ability).not_to be_able_to(:manage, Book.new) }
      it { expect(ability).not_to be_able_to(:manage, Author.new) }
      it { expect(ability).not_to be_able_to(:manage, Category.new) }

    end
  end
end