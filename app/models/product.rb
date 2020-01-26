class Product < ApplicationRecord
  include PgSearch::Model

  validates :title, :description, :price, presence: true

  validates :price, numericality: { greater_than: 0 }

  scope :for_country, ->(country) { country.presence ? where(country: country.to_s) : all }
  scope :price_equals, ->(price) { where('products.price = ?', price) }
  scope :price_less_than, ->(price) { where('products.price < ?', price) }
  scope :price_greater_than, ->(price) { where('products.price > ?', price) }
  scope :lowest_price, -> { reorder(price: :asc) }
  scope :highest_price, -> { reorder(price: :desc) }
  scope :newest, -> { reorder(created_at: :desc) }

  SORT_CRITERIA = ['relevance', 'newest', 'lowest_price', 'highest_price']

  pg_search_scope :text_search, against: [ [:title, 'A'], :description, :tags ], using: { tsearch: {dictionary: "simple"} }


  def self.search(query)
    if query.present?
      text_search(query)
    else
      all
    end
  end
end
