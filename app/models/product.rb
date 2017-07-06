class Product < ApplicationRecord
  has_many :reviews

  validates :name, :cost, :country, :presence => true

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviewed, -> { select("products.name, products.id, count(reviews.id) as reviews_count").joins(:reviews).group("products.id").order("reviews_count DESC").limit(1) }
  scope :made_in_usa, -> { where(country: 'USA') }
end
