json.array! @artist.songs.each do |song|

  json.extract! song, :id, :name, :created_at, :updated_at, :artist_id
  json.url artist_song_url(@artist, song, format: json)
end
# #
# json.array! @artists do |artist|
#   json.extract! artist, :id, :name, :created_at, :updated_at
#   json.songs @artist.songs do |song|
#     json.extract! song, :id, :name, :created_at, :updated_at, :artist_id
#   end
# end

# json.set! :artists do
#   @artists.each do |artist|
#     json.set! artist.song do
#       json.(song, :id, :name, :artist_id)
#     end
#   end
# end
