json.array! @artist.songs.each do |song|

  json.extract! song, :id, :name, :created_at, :updated_at, :artist_id

end
