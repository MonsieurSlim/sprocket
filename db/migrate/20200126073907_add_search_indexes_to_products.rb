class AddSearchIndexesToProducts < ActiveRecord::Migration[5.2]
  def up
    execute "create index products_title on products using gin(to_tsvector('english', title))"
    execute "create index products_description on products using gin(to_tsvector('english', description))"
    execute "create index products_tags on products using gin(to_tsvector('english', tags))"
  end

  def down
    execute "drop index products_title"
    execute "drop index products_description"
    execute "drop index products_tags"
  end
end
