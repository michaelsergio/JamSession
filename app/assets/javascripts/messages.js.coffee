$('#messages').ready ->
  $('.reply-btn').click ->
    $(this).parent().children('.reply').slideToggle()
