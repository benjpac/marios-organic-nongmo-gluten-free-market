class Product < ApplicationRecord
  has_many :reviews

  validates :name, :cost, :country, :presence => true
end
