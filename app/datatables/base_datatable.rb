class BaseDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :view, :h, :link_to, :number_to_currency, :pluralize
  def_delegator 'Rails.application.routes', :url_helpers

  def get_raw_records
    options[:collection]
  end

  def view
    @view ||= options[:view]
  end
end
