class Admin::GenresController < ApplicationController
  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    @genre.save
  end
  def destroy
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre.destroy
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
