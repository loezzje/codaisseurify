class PagesController < ApplicationController
  def index
    @artists = artist.all
  end
end
