class Public::RanksController < ApplicationController
  def rank
  # 投稿のコメント数ランキング
  # @customer_comment_ranks = Customer.find(Comment.group(:customer_id).order('count(customer_id) desc').pluck(:customer_id))
  @comment_favorite_ranks = Comment.find(Favorite.group(:comment_id).order('count(comment_id) desc').pluck(:commnent_id))
  @comment = Comment.new
  end
end
