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
          country: $("select#product_country").val(),
          pricing: $("form#products .ui.radio.checkbox.checked input").attr('id'),
          price: $("input#product_price").val() }
    columns: [
      { data: 'title' }
      { data: 'description' }
      { data: 'tags' }
      { data: 'country' }
      { data: 'price' }
    ]


$(document).on 'change', "select#product_country, select#product_sort, #products_datatable_filter input", ->
  $('#products_datatable').DataTable().ajax.reload()

$(document).on 'click', "form#products .reset-button", ->
  $('form#products .ui.dropdown').dropdown('restore defaults')
  $('form#products .ui.radio.checkbox').checkbox('uncheck')
  $('form#products input').val('')
  $('#products_datatable').DataTable().ajax.reload()


$(document).on 'change', "form#products .ui.radio.checkbox", ->
  $('#products_datatable').DataTable().ajax.reload()

$(document).on 'keyup', "input#product_price", ->
  $('#products_datatable').DataTable().ajax.reload()

