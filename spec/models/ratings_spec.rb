require 'rails_helper'
 
describe Rating do
  let(:rating) { Rating.new }
 

  it { should belong_to :book }
  it { should belong_to :costumer }

end
