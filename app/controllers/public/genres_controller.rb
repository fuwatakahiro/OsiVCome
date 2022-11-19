class Public::GenresController < ApplicationController
  def index
    @genre = Genre.find(params[:id])
    @characters = @genre.charcters.page(params[:page])
  end
end
