class ProductDatatable < BaseDatatable

  def view_columns
    @view_columns ||= {
        title:  { source: "Product.title" },
        description:  { source: "Product.description" },
        tags:  { source: "Product.tags" },
        country:  { source: "Product.country" },
        price:  { source: "Product.price" }
    }
  end

  def data
    records.map do |record|
      {
          title: record.title,
          description: record.description,
          tags: view.product_tags(record.tags),
          country: record.country,
          price: number_to_currency(record.price)
      }
    end
  end
end
