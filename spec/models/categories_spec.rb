require 'rails_helper'
 
describe Category do
  let(:category) { Category.new }
 
  it { expect(category).to validate_presence_of(:title) }
  it { expect(category).to validate_uniqueness_of(:title) }
  it { should have_many :books }


end