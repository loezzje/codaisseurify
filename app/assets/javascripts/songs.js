function toggleToBeDelete() {
  var checkbox = this;
  $(checkbox).parent().toggleClass("toBeDeleted");
}

function submitSong(event) {
  event.preventDefault();
  var title = $("#new_song").val();

  createSong(title);
  $("#new_song").val(null);
}

function createSong(title) {
  var checkboxId = "song-" + nextSongId();

  var listItem = $("<li></li>");
  listItem.addClass("song");

  var checkbox = $('<input>');
  checkbox.attr('type', 'checkbox');
  checkbox.attr('id', checkboxId);
  checkbox.bind('change', toggleToBeDelete);

  var space = document.createTextNode(" ");

  var label = $('<label></label>');
  label.attr('for', "song-" + checkboxId);
  label.html(title);

  listItem.append(checkbox);
  listItem.append(space);
  listItem.append(label);

  $("#song").append( listItem );

  // var newSong = { name: title, toBeDeleted: false };
  //
  // $.ajax({
  //   type: "POST",
  //   url: "/artists/:id.json",
  //   data: JSON.stringify({
  //       song: newSong
  //   }),
  //   contentType: "application/json",
  //   dataType: "json"
  // });
}


function nextSongId() {
  return $(".song").length + 1;
}

function deleteSelectedSongs(event) {
  event.preventDefault();
  $.when($(".toBeDeleted").remove());
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleToBeDelete);
  $("#delete").bind('click', deleteSelectedSongs);
  $("form").bind('submit', submitSong);
});
