function toggleToBeDelete() {
  var checkbox = this;
  $(checkbox).parent().toggleClass("toBeDeleted");
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleToBeDelete);
});
