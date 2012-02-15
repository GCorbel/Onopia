# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $("select#user_theme_id").wijdropdown()   
  $("#accordion").wijaccordion();

  $("select#user_theme_id").change ->
    $("form#update_theme").submit()
    
  $(":input[type='text'],:input[type='password'],textarea").wijtextbox()
  $(":input[type='radio']").wijradio()
  $(":input[type='checkbox']").wijcheckbox()
  $(":input[type='submit']").button()

    
