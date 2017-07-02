class Review < ApplicationRecord
  belongs_to :product

  validates :author, :content_body, :rating, :product_id, :presence => true 
end
