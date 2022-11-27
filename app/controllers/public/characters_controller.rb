class Public::CharactersController < ApplicationController
    before_action :authenticate_customer!
  def index
    @genres = Genre.all
    if params[:genre_id]
      @characters = Character.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    else
      @characters = Character.page(params[:page]).per(8)
    end
  end
  def show
    @character = Character.find(params[:id])
    @comment =Comment.new
    @comments = @character.comments.order("created_at DESC").page(params[:page])
    if params[:rank] == "desc"
      #TODO: Comment.find_each {|i| Comment.reset_counters(i.id, :favorites)}
      @comments = @character.comments.order('favorites_count DESC').page(params[:page])
    end
  end
end
