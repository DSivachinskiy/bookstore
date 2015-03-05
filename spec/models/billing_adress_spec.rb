require 'rails_helper'
 
describe BillingAdress do
  let(:adress) { BillingAdress.new }
 
  it { expect(adress).to validate_presence_of(:adress) }
  it { expect(adress).to validate_presence_of(:zipcode) }
  it { expect(adress).to validate_presence_of(:city) }
  it { expect(adress).to validate_presence_of(:phone) }
  it { should belong_to :country }
  it { should belong_to :costumer }
  it { should have_many :orders }

end