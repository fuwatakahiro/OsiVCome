class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    if params[:rank] == 'desc'
      # 投稿のコメント数ランキング
      customer_all = Customer.all.order('id desc').ids
      customer_comment_ranks = Comment.group(:customer_id).order('count(customer_id) desc').pluck(:customer_id)
      customer_rank =customer_cmment_ranks = customer_comment_ranks.push(*(customer_all-customer_comment_ranks))
      @customers = Customer.find(customer_rank)
    end
  end
  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments
  end
  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="ユーザー編集しました"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
  private
  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted, :introduction)
  end
end
