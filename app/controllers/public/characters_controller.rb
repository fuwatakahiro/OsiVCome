class Public::CharactersController < ApplicationController
  def index
    @characters = Character.all
  end
  def show
    @character = Character.find(params[:id])
    @comment =Comment.new
    @comments = @character.comments
  end
end
