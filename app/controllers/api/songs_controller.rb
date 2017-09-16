class Api::SongsController < ApplicationController
  skip_before_action :verify_authenticity_token
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
      render status: 201, json: {
        message: "Song succecfully created",
        artist: @artist,
        song: song
      }.to_json
    else
      render status: 422, json: {
        message: "Song could not be created",
        errors: song.errors
      }.to_json
    end
  end

  def destroy
    song = @artist.songs.find(params[:id])
    song.destroy

    render status:200, json: {
      message: "Song destroyed"
    }.to_json
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
