require 'rails_helper'
 
describe Book do
  let(:book) { Book.new }
 
  it { expect(book).to validate_presence_of(:title) }
  it { expect(book).to validate_presence_of(:price) }
  it { expect(book).to validate_presence_of(:books_in_stock) }

  it { should belong_to :category}
  it { should belong_to :author }
  it { should have_many :ratings }
  it { should have_many :order_items }

end