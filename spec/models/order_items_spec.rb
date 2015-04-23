require 'rails_helper'
 
describe OrderItem do
  let(:author) { FactoryGirl.create(:author) }
  let(:category) { FactoryGirl.create(:category) }
  let(:book) { FactoryGirl.create(:book, author: author, category: category) }
  let(:order) { FactoryGirl.create(:order) }
  let(:order_item) { FactoryGirl.create(:order_item, book: book, order: order) }
 
  it { expect(order_item).to validate_presence_of(:quantity) }
  it { should belong_to :book }
  it { should belong_to :order }

  it "calculates price" do
    expect(order_item.price).to eq(3333)
  end
end