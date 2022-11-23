class Admin::CharactersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @characters = Character.page(params[:page]).per(10)
    @genre = Genre.new
    @genres = Genre.all
  end

  def new
    @character = Character.new
  end
  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:notice]="新しいキャラクターを生成しました"
      redirect_to admin_character_path(@character)
    else
      render :new
    end
  end
  def edit
    @character = Character.find(params[:id])
  end
  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      flash[:notice] = "キャラクターを更新しました"
      redirect_to admin_character_path(@character)
    else
      render :edit
    end
  end
  def show
   @character = Character.find(params[:id])
  end
  private
  def character_params
    params.require(:character).permit(:character_image, :greeting, :name, :genre_id, :reference_destination)
  end
end
