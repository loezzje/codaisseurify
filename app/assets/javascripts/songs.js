function toggleToBeDelete() {
  var checkbox = this;
  var listItem = $(this).parent();
  $(checkbox).parent().toggleClass("toBeDeleted");
}

function submitSong(event) {
  event.preventDefault();
  var title = $("#song_name").val();

  createSong(title);
  $("#song_name").val(null);
}

function createSong(title) {
  var newSong = { name: title, toBeDeleted: false };
  var artistId = $('li').parent().data('id');

  $.ajax({
    type: "POST",
    url: "/artists/" + artistId + "/songs.json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    var checkboxId = data.id;

    var listItem = $("<li></li>");
    listItem.addClass("song");

    var checkbox = $('<input>');
    checkbox.attr('type', 'checkbox');
    checkbox.attr('id', checkboxId);
    checkbox.val(1);
    checkbox.bind('change', toggleToBeDelete);

    var space = document.createTextNode(" ");

    var label = $('<label></label>');
    label.attr('for', "song-" + checkboxId);
    label.html(title);

    listItem.append(checkbox);
    listItem.append(space);
    listItem.append(label);

    $("#song").append( listItem );
    location.reload(true);
  });
}


//
// function removeDeletedSongs (event) {
//
//   $.each($(".toBeDeleted"), function(show, listItem) {
//     var checkbox = this;
//     var songId = $(this).data('id');
//     var artistId = $('li').parent().data('id');
//
//     // var unorderedList = $(this).parent().parent();
//     // artistId = unorderedList.data('id');
//     deleteSelectedSongs(songId);
//   });
// }

//   ($(listItem).data('id');
//   deleteSelectedSongs())
// }

// function cleanDeletedSongs(event) {
//
//
//   $.each($(".toBeDeleted"), function(index, listItem) {
//
//
//     deleteSelectedSongs(artistId, songId);
//   });
// }
function deleteAllSongs(event) {
  event.preventDefault();
  var artistId = $('li').parent().data('id');
  
  $.ajax({
   type: "DELETE",
   url: "/artists/" + artistId + "/songs/" + songId + ".json",
   contentType: "application/json",
   dataType: "json"
 })
  $(".song").remove();
}


function deleteSelectedSongs(event) {
  event.preventDefault();
  var artistId = $('li').parent().data('id');
  var checkbox = this;
  var listItem = $(this).parent();
  var songId = listItem.data('id');

  //
  // var checkbox = this;
  // var listItem = $(this).parent();
  // var songId = listItem.data('id');

  $.ajax({
   type: "DELETE",
   url: "/artists/" + artistId + "/songs/" + songId + ".json",
   contentType: "application/json",
   dataType: "json"
 })
 .done(function(data){
  $(".toBeDeleted").remove();
 });
 }


$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleToBeDelete);
  $("#delete").bind('click', deleteSelectedSongs);
  $("#deleteall").bind('click', deleteAllSongs);
  $("form").bind('submit', submitSong);
});
