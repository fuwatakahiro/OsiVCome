class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!
  before_action :character_comments, only: [:create, :destroy]
   before_action :ensure_correct_commenter,only: :destroy
  def create
    @comment = current_customer.comments.new(comment_params)
    @comment.character_id = @character.id
    @comment.save
  end
  def destroy
    @comment = Comment.find_by(id: params[:id], character_id: params[:character_id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :character_name)
  end
  def character_comments
    @character = Character.find(params[:character_id])
    if params[:rank] == "desc"
      @comments = @character.comments.order("favorites_count DESC").page(params[:page]).per(5)
    else
    @comments = @character.comments.order("created_at DESC").page(params[:page]).per(5)
    end
  end
  def ensure_correct_commenter
    @comment = Comment.find(params[:id])
    unless @comment.customer_id == current_customer.id
      flash[:notice] = "他のユーザーは消去できません"
      redirect_to request.referer
    end
  end
end
