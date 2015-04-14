require 'rails_helper'
 
describe Costumer do
  let(:costumer) { Costumer.new }
 
  it { expect(costumer).to validate_presence_of(:email) }
  it { expect(costumer).to validate_uniqueness_of(:email) }
  it { expect(costumer).to validate_presence_of(:password) }
  it { expect(costumer).to validate_presence_of(:firstname) }
  it { expect(costumer).to validate_presence_of(:lastname) }

  it { should have_many :orders }
  it { should have_many :ratings }
  it { should have_one :adress }
  it { should have_one :billing_adress }
  it { should have_one :credit_card }

end
