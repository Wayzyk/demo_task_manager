$ ->
  $("a[data-remote]").on "ajax.success", event ->
    alert "The task was deleted."
