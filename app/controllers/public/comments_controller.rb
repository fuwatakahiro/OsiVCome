class Public::CommentsController < ApplicationController
  before_action :character_comments, only: [:create, :destroy]
  def create
    # @character = Character.find(params[:character_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.character_id = @character.id
    @comment.save
    # @comments = @character.comments
    flash[:notice] = "コメントしました"
    redirect_to request.referer
  end
  def destroy
    # @character = Character.find(params[:character_id])
    # @comments = @character.comments
    @comment = Comment.find_by(id: params[:id], character_id: params[:character_id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :character_name)
  end
  def character_comments
    @character = Character.find(params[:character_id])
    @comments = @character.comments
  end
end
