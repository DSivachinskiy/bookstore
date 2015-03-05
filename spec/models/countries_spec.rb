require 'rails_helper'
 
describe Country do
  let(:country) { Country.new }
 
  it { expect(country).to validate_presence_of(:name) }
  it { expect(country).to validate_uniqueness_of(:name) }
  it { should have_many :adresses }
  it { should have_many :billing_adresses }
end