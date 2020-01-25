class Product < ApplicationRecord

  validates :title, :description, :tags, :price, presence: true

  validates :price, numericality: { greater_than: 0 }

  scope :for_country, ->(country) { where(country: country.to_s) }
  scope :price_equals, ->(price) { where('products.price = ?', price) }
  scope :price_less_than, ->(price) { where('products.price < ?', price) }
  scope :price_greater_than, ->(price) { where('products.price > ?', price) }
  scope :lowest_price, -> { order(price: :asc) }
  scope :highest_price, -> { order(price: :desc) }
  scope :newest, -> { order(created_at: :desc) }

  scope :search, lambda { |q| where('products.title ILIKE :term OR products.description ILIKE :term', term: "%#{q}%") }


  SORT_CRITERIA = ['relevance', 'newest', 'lowest_price', 'highest_price']
end
