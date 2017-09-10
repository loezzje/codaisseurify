class ArtistsController < ApplicationController


  def index
    @artists = Artist.all
  end
  def show
    @artist = Artist.find(params[:id])
    @photo = @artist.photo
  end

  def new
    @artist = Artist.new
  end

  def create
  @artist = Artist.new(artist_params)

  if @artist.save


    redirect_to artist_path(@artist), notice: "Artist successfully created"
  else
    render :new
  end
end

private

  def artist_params
    params
    .require(:artist)
    .permit(:name, :song_ids, :image)
  end



end
