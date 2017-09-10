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
    @song = artist.song.new(song_params)
  end

  def create
    artist = Artist.find(params[:artist_id])
    @song = artist.song.new(song_params)
    if @song.save
    redirect_to artist_path, notice: "Song successfully created"
  else
    render 'new'
  end




private

def song_params
  params
  .require(:song)
  .permit(:name)

end

end
