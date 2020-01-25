class ProductDatatable < BaseDatatable

  def view_columns
    @view_columns ||= {
        title:  { source: "Product.title", cond: :like, searchable: true, orderable: false },
        tags:  { source: "Product.tags", searchable: false, orderable: false },
        country:  { source: "Product.country", searchable: false, orderable: true },
        price:  { source: "Product.price", searchable: false, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
          title: record.title,
          tags: view.product_tags(record.tags),
          country: record.country,
          price: number_to_currency(record.price)
      }
    end
  end
end
