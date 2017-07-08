require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country }
end

# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Product do
  it 'creates and validates product data for all fields and creates a review and checks the association with the review' do
    product = FactoryGirl.create(:product)
    product.name.should eq 'Biscuit'
    product.cost.should eq 3
    product.country.should eq 'USA'
    review = product.reviews.create
    review.product_id.should eq product.id
  end
end