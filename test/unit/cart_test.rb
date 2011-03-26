require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "cart should create a line item when adding a product" do
    cart = Cart.create
    line_item = cart.add_product(products(:ruby).id, products(:ruby).price)
    line_item.save!
    assert_equal 1, cart.line_items.size

    line_item = cart.add_product(products(:one).id,products(:one).price)
    line_item.save!
    assert_equal 2, cart.line_items.size
  end

  test "cart should not create a line item for duplicate products" do
    cart = Cart.create
    line_item = cart.add_product(products(:ruby).id, products(:ruby).price)
    line_item.save!
    assert_equal 1, cart.line_items.size

    line_item = cart.add_product(products(:ruby).id,products(:ruby).price)
    line_item.save!
    assert_equal 1, cart.line_items.size
  end
end
