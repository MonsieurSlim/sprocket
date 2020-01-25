module ApplicationHelper
  def product_tags(tags)
    tags = tags.split(", ")
    labels = []
    tags.each do |tag|
      labels << content_tag(:div, tag, class: "ui blue horizontal label")
    end
    labels.join.html_safe
  end
end
