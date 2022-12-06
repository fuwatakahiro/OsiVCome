class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @customer = Customer.find(params[:customer_id])
    @comments = @customer.comments.page(params[:page]).per(5)
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
