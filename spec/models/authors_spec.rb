require 'rails_helper'
 
describe Author do
  let(:author) { Author.new }
 
  it { expect(author).to validate_presence_of(:firstname) }
  it { expect(author).to validate_presence_of(:lastname) }
  it { should have_many :books }


end