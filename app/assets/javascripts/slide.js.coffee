# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
# Expand Panel
	$("#open").click ->
		$("div#panel").slideDown("slow")
	
# Collapse Panel
	$("#close").click ->
		$("div#panel").slideUp("slow")
	
# Switch buttons from "Log In | Register" to "Close Panel" on click
	$("#toggle a").click ->
		$("#toggle a").toggle()
