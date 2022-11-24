class Public::CharactersController < ApplicationController
  def index
    @genres = Genre.all
    if params[:genre_id]
      @characters = Character.where(genre_id: params[:genre_id]).page(params[:page])
    else
      @characters = Character.page(params[:page]).per(8)
    end
  end
  def show
    @character = Character.find(params[:id])
    @comment =Comment.new
    @comments = @character.comments.page(params[:page]).per(5)
    # #リンクの引数で,query parameterを作って,それをparameterとして使い、条件分岐で詳細ページで表示するものを変えた
    if params[:rank] == "desc"
      #TODO: Comment.find_each {|i| Comment.reset_counters(i.id, :favorites)}
      @comments = @comments.order('favorites_count DESC').page(params[:page])
    end
  end
end
