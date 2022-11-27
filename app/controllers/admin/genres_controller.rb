class Admin::GenresController < ApplicationController
   before_action :authenticate_admin!
   before_action :genres, only: [:create, :destroy]
  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
  def genres
    @genres = Genre.all
  end
end
