class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :country
      t.string :tags
      t.decimal :price

      t.timestamps null: false
    end

    file = File.read('db/uploads/products.json')
    JSON.parse(file).each { |content| Product.create(content) }
  end

  def down
    drop_table :products
  end
end
