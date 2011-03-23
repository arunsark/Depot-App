class StoreController < ApplicationController
  def index
    @products = Product.all
    @visit_count = store_visit_count
  end

end
