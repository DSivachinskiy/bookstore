require 'rails_helper'
 
describe OrderStatus do
  let(:status) { OrderStatus.new }
 
  it { expect(status).to validate_presence_of(:status) }
 it { should have_many :orders }

end