require "rails_helper"

RSpec.describe Product, type: :model do
  subject { create(:product) }

  context "validations" do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:description) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_numericality_of(:price).is_greater_than(0) }
  end

  # scope :for_country, ->(country) { country.presence ? where(country: country.to_s) : all }
  # scope :price_equals, ->(price) { where('products.price = ?', price) }
  # scope :price_less_than, ->(price) { where('products.price < ?', price) }
  # scope :price_greater_than, ->(price) { where('products.price > ?', price) }
  # scope :lowest_price, -> { reorder(price: :asc) }
  # scope :highest_price, -> { reorder(price: :desc) }
  # scope :newest, -> { reorder(created_at: :desc) }
  # search

  context "scopes" do
    describe ".for_country" do
      let!(:origin_us) { create :product, country: "United States" }
      let!(:origin_canada) { create :product, country: "Canada" }

      subject { Product.for_country("Canada") }

      it { is_expected.not_to include origin_us }
      it { is_expected.to include origin_canada }
    end

    describe "pricing" do
      let!(:five_dollars) { create :product, price: 5.0 }
      let!(:ten_dollars) { create :product, price: 10.0 }

      context ".price_equals" do
        subject { Product.price_equals(5) }

        it { is_expected.not_to include ten_dollars }
        it { is_expected.to include five_dollars }
      end

      context ".price_less_than" do
        subject { Product.price_less_than(10) }

        it { is_expected.not_to include ten_dollars }
        it { is_expected.to include five_dollars }
      end

      context ".price_greater_than" do
        subject { Product.price_greater_than(5) }

        it { is_expected.not_to include five_dollars }
        it { is_expected.to include ten_dollars }
      end
    end

    describe "sort by price" do
      before(:each)do
        (5..20).step(5).each { |price| create :product, price: price }
      end

      context ".lowest_price" do
        subject { Product.lowest_price }

        it { expect(subject.first.price).to eql(5) }
        it { expect(subject.last.price).to eql(20) }
      end

      context ".highest_price" do
        subject { Product.highest_price }

        it { expect(subject.first.price).to eql(20) }
        it { expect(subject.last.price).to eql(5) }
      end
    end

    describe ".newest" do
      before(:each)do
        (3.days.ago.to_date..Date.current).each { |date| create :product, created_at: date }
      end

      subject { Product.newest }

      it { expect(subject.first.created_at.to_date).to eql(Date.current) }
      it { expect(subject.last.created_at.to_date).to eql(3.days.ago.to_date) }
    end

    describe "#search" do
      let!(:shirt_title) { create :product, title: "Shirt made of cotton" }
      let!(:shirt_desc) { create :product, description: "Shirt made of cotton" }
      let!(:shirt_tag) { create :product, tags: "shirt, cotton" }

      it "searches by titles" do
        expect(Product.search("shirt")).to include(shirt_title)
      end

      it "searches by description" do
        expect(Product.search("shirt")).to include(shirt_desc)
      end

      it "searches by tags" do
        expect(Product.search("shirt")).to include(shirt_tag)
      end

      it "prioritize title results" do
        expect(Product.search("shirt").first).to eql(shirt_title)
      end
    end
  end
end
