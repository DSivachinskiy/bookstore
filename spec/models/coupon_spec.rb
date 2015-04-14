require 'rails_helper'

describe Coupon do
  let(:coupon) { Coupon.new }
    it { expect(coupon).to validate_presence_of(:number) }
    it { expect(coupon).to validate_uniqueness_of(:number) }
end
