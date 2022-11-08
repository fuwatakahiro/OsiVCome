class Admin::CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end
  def create
    character = Character.new(character_params)
    character.save
    redirect_to admin_character_path(character)
  end
  def edit
    @character = Character.find(params[:id])
  end
  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to admin_character_path(@character)
  end
  def show
   @character = Character.find(params[:id])
  end
  private
  def character_params
    params.require(:character).permit(:character_image, :greeting, :name, :genre, :reference_destination)
  end
end
