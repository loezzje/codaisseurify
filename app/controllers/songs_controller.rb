class SongsController < ApplicationController


  def index
    artist = Artist.find(params[:artist_id])
    @songs = artist.songs
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
    @song = artist.songs.create(song_params)
    if @song.save
      redirect_to artist_path(artist), notice: "Song successfully created"
    else
      render 'new'
    end
  end


  def destroy
    artist = Artist.find(params[:artist_id])
    @song = artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(params[:artist_id]), notice: "Song successfully deleted"
  end


#
private

  def song_params
    params
    .require(:song)
    .permit(:id, :name, :artist_id)

  end

end
