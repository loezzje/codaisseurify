class Api::ArtistsController < ApplicationController


  def index
    render status: 200, json: {
      artist: Artist.all
    }.to_json
  end

  def show
    render status: 200, json: {
      artist: Artist.find(params[:id])
    }.to_json
  end

private

  def artist_params
    params
    .require(:artist)
    .permit(:name, songs: [:id, :name])
  end
end
