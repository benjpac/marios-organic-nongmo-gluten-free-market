class Review < ApplicationRecord
  belongs_to :product

  validates :author, :content_body, :rating, :product_id, :presence => true 
  validates :content_body, length: { minimum: 50 }
  validates :content_body, length: { maximum: 250 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }  
end
