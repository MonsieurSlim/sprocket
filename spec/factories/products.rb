FactoryBot.define do
  factory :product do
    title { "Product title" }
    description { "Product description" }
    tags { "random" }
    price { 15.9 }
  end
end
