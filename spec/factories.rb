FactoryGirl.define do

  factory(:product) do
    name('Biscuit')
    cost(3)
    country('USA')
  end
  
  factory(:review) do
    author('Ben')
    content_body('this is a great product')
    rating(5)
    product_id(1)
  end

end