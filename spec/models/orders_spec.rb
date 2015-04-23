require 'rails_helper'
 
describe Order do
  let(:costumer) { FactoryGirl.create(:costumer) }
  let(:author) { FactoryGirl.create(:author) }
  let(:category) { FactoryGirl.create(:category) }
  let(:book) { FactoryGirl.create(:book, author: author, category: category) }
  let(:order) { FactoryGirl.create(:order, costumer: costumer) }
  let(:order_item) { FactoryGirl.create(:order_item, order: order, book: book) }
  let(:coupon) { FactoryGirl.create(:coupon) }
  let(:order_item2) { FactoryGirl.create(:order_item, order: order, book: book) }

  context 'belongs and validations' do
    it { expect(order).to validate_presence_of(:costumer_id) }
    it { should belong_to :credit_card }
    it { should belong_to :costumer }
    it { should belong_to :adress }
    it { should belong_to :billing_adress }
    it { should have_many :order_items }
  end
  describe 'custom methods' do
    context 'calculate method' do
      it "calculates total price with ups and no coupon" do
        order.order_items = [order_item]
        order.save_price
        expect(order.total_price).to eq(3338)
      end
      it "calculates total price with no ups no coupon" do
        order.ups = 0
        order.order_items = [order_item]
        order.save_price
        expect(order.total_price).to eq(3333)
      end
      it "calculates total price with coupon and ups" do
        order.coupon_number = coupon.number
        order.order_items = [order_item]
        order.save_price
        expect(order.total_price).to eq(3323)
      end
      it "calculates total price with coupon and no ups" do
        order.ups = 0
        order.coupon_number = coupon.number
        order.order_items = [order_item]
        order.save_price
        expect(order.total_price).to eq(3318)
      end
    end
    context 'other methods' do
      it "calculates books in stock" do
        order.order_items = [order_item]
        order.aasm_state = "waiting_for_processing"
        order.book_count
        expect(book.books_in_stock).to eq(19)
      end
      it "calculates order_quantity" do
        order.order_items = [order_item, order_item2]
        order.aasm_state = "in_progress"
        expect(order.order_quantity).to eq(6)
      end
    end
  end
end
