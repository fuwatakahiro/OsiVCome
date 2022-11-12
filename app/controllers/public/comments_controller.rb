class Public::CommentsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.character_id = @character.id
    @comment.save
    @comments = @character.comments
  end
  def destroy
    @character = Character.find(params[:character_id])
    @comment = Comment.find_by(id: params[:id], character_id: params[:character_id])
    @comment.destroy
    @comments = @character.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :character_name)
  end
end
