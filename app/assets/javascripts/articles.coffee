change_visibility = (status) ->
  if status == "Scheduled"
    $(".published-field").show()
  else
    $(".published-field").hide()

jQuery ->
  change_visibility $("#article_status :selected").text()
  $("#article_status").on "change", (e) ->
    change_visibility $(this).find(":selected").text()
