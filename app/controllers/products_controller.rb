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
    @products = Product.search(params[:search][:value]).for_country(params[:country]).send(params[:sort].to_sym)
    @products = @products.send(params[:pricing]) if params[:pricing].presence
  end

end