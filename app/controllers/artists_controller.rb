class ArtistsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  # def new
  #   @artist = Artist.new
  # end
#
#   def create
#   @artist = Artist.new(artist_params)
#
#     redirect_to artist_path(@artist), notice: "Artist successfully created"
#   else
#     if @artist.save
#     render 'new'
#   end
# end

def destroy
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect_to root_path
end

private

  def artist_params
    params
    .require(:artist)
    .permit(:name)
  end
end
