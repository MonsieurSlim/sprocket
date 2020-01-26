$(document).on "turbolinks:load", ->
  $('#products_datatable').dataTable
    processing: true
    serverSide: true
    pageLength: 15
    lengthMenu: $('#products_datatable').data('length-menu')
    ajax:
      url: $('#products_datatable').data('source')
      data: (d) ->
        $.extend {}, d, {
          sort: $("select#product_sort").val(),
          country: $("select#product_country").val() }
    columns: [
      { data: 'title' }
      { data: 'tags' }
      { data: 'country' }
      { data: 'price' }
    ]


$(document).on 'change', "select#product_country, select#product_sort, #products_datatable_filter input", ->
  $('#products_datatable').DataTable().ajax.reload()

$(document).on 'click', "form#product .reset-button", ->
  $('form#product .ui.dropdown').dropdown('restore defaults')
  $('#products_datatable').DataTable().ajax.reload()
