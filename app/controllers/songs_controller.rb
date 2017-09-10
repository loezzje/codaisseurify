class SongsController < ApplicationController

  def index
    artist = Artist.find(params[:artist_id])
    @song = artist.songs
  end

def show
  artist = Artist.find(params[:artist_id])
  @song = artist.songs.find(params[:id])
end

  def new
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.build
  end

  def create
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.create(params[:song])
  end


private

def song_params
  params
  .require(:song, :artist_id)
  .permit(:name)

end

end
