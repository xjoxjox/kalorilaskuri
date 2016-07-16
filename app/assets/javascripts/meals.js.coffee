# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  products = $('#meal_product_id').html()
  $('#meal_category_id').change ->
    category = $('#meal_category_id :selected').text()
    options = $(products).filter("optgroup[label='#{category}']").html()
    if options
      $('#meal_product_id').html(options)
      $('#meal_product_id').parent().show()
    else
      $('#meal_product_id').empty()
      $('#meal_product_id').parent().hide()