require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content_body }
  it { should validate_presence_of :rating }
  it { should validate_presence_of :product_id }
end

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
