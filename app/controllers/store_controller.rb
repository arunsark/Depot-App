class StoreController < ApplicationController
  def index
    @products = Product.all
    @visit_count = store_visit_count
    @cart = current_cart
  end

end
