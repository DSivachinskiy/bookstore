require 'rails_helper'
 
describe Role do
  let(:role) { Role.new }
 
  it { expect(role).to validate_presence_of(:role) }
 it { should have_many :costumers }

end