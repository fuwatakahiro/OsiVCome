class Public::CommentsController < ApplicationController
  def create
    @character = Character.find(params[:character_id])
    @comments = @character.comments
    @comment = current_customer.comments.new(comment_params)
    @comment.character_id = @character.id
    @comment.save
    redirect_back  fallback_location: root_path
  end
  def destroy
    @character = Character.find(params[:character_id])
    @comments = @character.comments
    @comment = Comment.find_by(id: params[:id], character_id: params[:character_id])
    @comment.destroy
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :character_name)
  end
end
