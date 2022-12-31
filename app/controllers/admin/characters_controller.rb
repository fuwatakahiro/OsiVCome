class Admin::CharactersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_character, only: [:edit, :update, :show]
  def index
    #TODO:Character.find_each {|i| Character.reset_counters(i.id, :comments)}
    @characters = Character.order("comments_count DESC").page(params[:page]).per(10)
    @genre = Genre.new
    @genres = Genre.all
  end

  def new
    @character = Character.new
  end
  def create
    @character = Character.new(character_params)
    if @character.save
       group = Group.new
       group.character_id = @character.id
       group.save
      flash[:notice]="新しいキャラクターを生成しました"
      redirect_to admin_character_path(@character)
    else
      render "error"
    end
  end
  def edit
  end
  def update
    if @character.update(character_params)
      flash[:notice] = "キャラクターを更新しました"
      redirect_to admin_character_path(@character)
    else
      render "error"
    end
  end
  def show
  end

  private

  def character_params
    params.require(:character).permit(:character_image, :greeting, :name,:birth_day,:birth_month, :genre_id, :reference_destination)
  end
  def find_character
    @character = Character.find(params[:id])
  end
end
