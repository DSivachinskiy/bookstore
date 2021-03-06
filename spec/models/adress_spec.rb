require 'rails_helper'
 
describe Adress do
  let(:adress) { Adress.new }
 
  it { expect(adress).to validate_presence_of(:adress) }
  it { expect(adress).to validate_presence_of(:zipcode) }
  it { expect(adress).to validate_presence_of(:city) }
  it { expect(adress).to validate_presence_of(:phone) }
  it { should belong_to :country }
  it { should belong_to :costumer }
  it { should have_many :orders }
end