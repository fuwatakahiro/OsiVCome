class Public::FavoritesController < ApplicationController
  def create
    # @character= Character.find(params[:character_id])
     @comment = Comment.find(params[:comment_id])
     @favorite = current_customer.favorites.new(comment_id: @comment.id)
     @favorite.save
  end
  def destroy
    # @character = Character.find(params[:character_id])
     @comment = Comment.find(params[:comment_id])
    @favorite = current_customer.favorites.find_by(comment_id: @comment.id)
    @favorite.destroy
  end
end
