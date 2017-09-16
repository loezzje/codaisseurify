function toggleToBeDelete() {
  var checkbox = this;
  $(checkbox).parent().toggleClass("toBeDeleted");
}

// function submitSong() {
//   event.preventDefault();
//   var title = $("#new-song").val();
//
//   createSong(title);
//   $("#new-song").val(null);
// }
//
// function createSong(title) {
//   var checkboxId = "song-" +
// }

function deleteSelectedSongs(event) {
  event.preventDefault();
  $.when($(".toBeDeleted").remove())
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleToBeDelete);
  $("#delete").bind('click', deleteSelectedSongs);
  // $("form").bind('submit', submitSong);
});
