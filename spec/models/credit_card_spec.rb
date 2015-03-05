require 'rails_helper'
 
describe CreditCard do
  let(:card) { CreditCard.new }
 
  it { expect(card).to validate_presence_of(:cvv) }
  it { expect(card).to validate_presence_of(:expiration_month) }
  it { expect(card).to validate_presence_of(:expiration_year) }
  it { expect(card).to validate_presence_of(:firstname) }
  it { expect(card).to validate_presence_of(:lastname) }
  it { should belong_to :costumer }
  it { should have_many :orders }

end