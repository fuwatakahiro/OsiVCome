class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_comment, only: [:create, :destroy, :check_customer]
  before_action :check_customer, only: [:create, :destroy]
  def create
     @favorite = current_customer.favorites.new(comment_id: @comment.id)
     @favorite.save
  end
  def destroy
    @favorite = current_customer.favorites.find_by(comment_id: @comment.id)
    @favorite.destroy
  end

  private

  def check_customer
    if @comment.customer_id == current_customer.id
      flash[:notice] = "自分のコメントにいいねはできません"
      redirect_to request.referer
    end
  end
  def find_comment
   @comment = Comment.find(params[:comment_id])
  end
end
