class Public::CharactersController < ApplicationController
  def index
    @characters = Character.page(params[:page]).per(8)
  end
  def show
    @character = Character.find(params[:id])
    @comment =Comment.new
    @comments = @character.comments.page(params[:page]).per(5)
    #リンクの引数で,query parameterを作って,それをparameterとして使い、条件分岐で詳細ページで表示するものを変えた
    if params[:rank] == "desc"
      #キャラクターに対するコメントをidが高い順に並べ、配列としてidを格納した
      original_comment_ids = @comments.order('id desc').ids
      #favoritesテーブルのカラムの中にあるcomment_idでどのコメントに対していいねをしたのかを探し、その中でいいねが多い順にして、commemtが持っているidで配列として格納している
      ranking_comment_ids = Favorite.group(:comment_id).order('count(comment_id) desc').pluck(:comment_id)
      #0いいねを表示させるためにrannking_comment_idsにpushメソッドを使って、0いいねのコメントをranking_comment_idsの履いてるに加えた
      #pushメソッドの引数は、キャラクターに描かれたコメントといいねを押されたidをひき,０いいねのidだけにした
      sorted_comment_ids = ranking_comment_ids.push(*(original_comment_ids - ranking_comment_ids))
      #0いいねも含まれ、いいねが多い順に表示ができるようになった。
      @comments = @character.comments.find(sorted_comment_ids)
    end
  end
end
