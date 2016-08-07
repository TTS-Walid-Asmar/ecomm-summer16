require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe 'requires a product and a cart' do
    let(:line_item_no_cart) {FactoryGirl.build_stubbed(:line_item, cart: nil)}
    let(:line_item_no_product) {FactoryGirl.build_stubbed(:line_item, product: nil)}

    specify {expect(line_item_no_cart).to be_invalid}
    specify {expect(line_item_no_product).to be_invalid}
  end

  describe 'when the parent cart is destroyed' do
    let(:cart) {FactoryGirl.create(:cart)}
    let(:line_item) {FactoryGirl.create(:line_item)}

    it "a line item is also destroyed" do
      cart.line_items<<line_item

      expect {cart.destroy}.to change {LineItem.count}.by(-1)
    end
  end
end
