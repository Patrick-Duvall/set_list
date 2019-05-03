class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def show

  end

  def create
  Artist.new(artist_params).save
  redirect_to "/artists/#{Artist.last.id}"
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
