class SongsController < ApplicationController
  before_action :get_artist

  def get_artist
    @artist = Artist.find(params[:artist_id]) if params[:artist_id]
  end

  def index
    @song = @artist.songs
  end

  def show
    @song = @artist.songs.find(params[:id])
  end

  def new
    @song = @artist.song.build(song_params)
  end

  def create
    @song = @artist.songs.build(song_params)
    if @song.save
      redirect_to artist_path(@artist), notice: "Song successfully created"
    else
      render 'new'
    end
  end


  def destroy
    @song = @artist.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(@artist), notice: "Song successfully deleted"
  end


private

  def song_params
    params
    .require(:song)
    .permit(:name)

  end

end
