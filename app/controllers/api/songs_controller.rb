class Api::SongsController < ApplicationController
  before_action :set_artist

  def index
    render status: 200, json: {
      songs: @artist.songs
    }.to_json
  end

  def show
    render status: 200, json: {
      song: @artist.songs.find(params[:id])
    }.to_json
  end

  def new
    render status: 200, json: {
      song: @artist.song.build(song_params)
    }.to_json
  end


  def create
    song = @artist.songs.build(song_params)
    if song.save
      reder status: 200, json: {
        message: "Song succecfully created",
        artist: @artist,
        song: song
      }.to_json
      redirect_to artist_path(@artist)
    else
      render status: 422, json: {
        message: "Song could not be created",
        errors: song.errors
      }.to_json
      render 'new'
    end
  end


private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params
    .require(:song)
    .permit(:name)
  end
end
