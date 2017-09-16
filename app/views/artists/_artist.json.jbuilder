json.extract! @artist.songs, :id, :name, :created_at, :updated_at
json.url artist_url(artist, format: :json)
