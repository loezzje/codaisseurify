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

    redirect_to artist_path(@artist), notice: "Artist successfully created"
  else
    if @artist.save
    render 'new'
  end
end

def destroy
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect_to root_path
end

private

  def artist_params
    params
    .require(:artist)
    .permit(:name, :photo => [:image_url], songs: [:id, :name])
  end
end
