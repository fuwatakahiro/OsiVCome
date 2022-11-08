class Admin::CharactersController < ApplicationController
  def index
    
  end

  def new
    @character = Character.new
  end
  def create
    character = Character.new(character_params)
    character.save
    redirect_to admin_character(character)
  end
  def edit
    
  end
  def update
    
  end
  def show
   @character = Character.find(params[:id]) 
  end
  private
  def character_params
    
  end
end
