class Public::RelationshipsController < ApplicationController
  def create

    @customer = Customer.find(params[:customer_id])
    current_customer.follower(@customer)
  end
  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollower(@customer)
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
