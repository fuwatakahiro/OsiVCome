class Public::FavoritesController < ApplicationController
  def create
    # @character= Character.find(params[:character_id])
     @comment = Comment.find(params[:comment_id])
     @favorite = current_customer.favorites.new(comment_id: @comment.id)
     @favorite.save
     redirect_back fallback_location: root_path
  end
  def destroy
    # @character = Character.find(params[:character_id])
    # @comment = Comment.find(params[:comment_id])
    @favorite = current_customer.favorites.find_by(comment_id: params[:comment_id])
    @favorite.destroy
    redirect_back fallback_location: root_path
  end
end
