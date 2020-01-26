class ProductsController < ApplicationController
  before_action :filter_products, only: :index

  def index
    @countries = Product.pluck(:country).uniq.sort
    respond_to do |format|
      format.html
      format.json { render json: ProductDatatable.new(params, view: view_context, collection: @products) }
    end
  end

  private

  def filter_products
    query = (params[:search][:value] rescue nil)
    @products = Product.search(query).for_country(params[:country])
    @products = @products.send(params[:sort]) if params[:sort] && params[:sort] != "relevance"
    # @products = @products.send(params[:pricing], params[:pricing][:price]) if params[:pricing][:price].presence
  end

end