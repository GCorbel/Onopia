#= require wijmo
#= require_tree ./wijmo/


@showMessage = (title, message) ->
  $("#message").html(message)
  popUp("#message", title)

popUp = (id, title) ->
  $(id).wijdialog({
    title: title,
    width: 400,
    autoOpen: true,
    modal: true,
    buttons: {
        Ok: () ->
          $(this).wijdialog("close")
    },
    captionButtons: {
        pin: { visible: false },
        refresh: { visible: false },
        toggle: { visible: false },
        minimize: { visible: false },
        maximize: { visible: false }
    }
  });

$("html").bind("ajaxSend", () ->
  $('body').css('cursor', 'wait')
)

$("html").bind("ajaxStop", () ->
  $('body').css('cursor', 'auto')
)

updateStyles = () ->
  $(":input[type='text'],:input[type='password'],textarea").wijtextbox()
  $(":input[type='radio']").wijradio()
  $(":input[type='checkbox']").wijcheckbox()
  $(":input[type='submit']").button()

