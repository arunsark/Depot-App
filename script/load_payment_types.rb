PaymentType.transaction do
  PaymentType.create(:payment_type=>"Check")
  PaymentType.create(:payment_type=>"Credit Card")
  PaymentType.create(:payment_type=>"Purchase Order")
end
