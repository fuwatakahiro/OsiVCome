class Public::RelationshipsController < ApplicationController
  def create
    @btn_customer = Customer.find(params[:customer_id])
    current_customer.follower(@btn_customer)
    unless params[:follow]
      @customer = current_customer
    else
      @customer = @btn_customer
    end
  end
  def destroy
    @btn_customer = Customer.find(params[:customer_id])
    current_customer.unfollower(@btn_customer)
    unless params[:follow]
      @customer = current_customer
    else
      @customer = @btn_customer
    end
  end
  def followings
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings.page(params[:page]).per(6)
  end
  def followers
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers.page(params[:page]).per(6)
  end
end
