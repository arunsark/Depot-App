Order.transaction do
  (1..100).each do |i|
    Order.create(:name => "Customer #{i}",
                 :address => "#{i} Main Street",
                 :email => "customer-#{i}@example.com",
                 :pay_type => "Check")
    (1..4).each do |j|
      LineItem.create(:product_id =>j, :order_id=>i, :quantity => 10, :price=>10.4)
    end
  end
end
