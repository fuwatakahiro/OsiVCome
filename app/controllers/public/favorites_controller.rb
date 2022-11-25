class Public::FavoritesController < ApplicationController
  before_action :check_customer, only: [:create, :destroy]
  def create
     @comment = Comment.find(params[:comment_id])
     @favorite = current_customer.favorites.new(comment_id: @comment.id)
     @favorite.save
  end
  def destroy
     @comment = Comment.find(params[:comment_id])
    @favorite = current_customer.favorites.find_by(comment_id: @comment.id)
    @favorite.destroy
  end
  
  private
  
  def check_customer
    character = Character.find(params[:character_id])
    @comment = Comment.find(params[:comment_id])
    if @comment.customer_id == current_customer.id
      flash[:notice] = "自分のコメントにいいねはできません"
      redirect_to character_path(character)
    end
  end
end
