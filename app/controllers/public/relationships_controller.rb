class Public::RelationshipsController < ApplicationController
    before_action :authenticate_customer!
    before_action :find_customer, only: [:create, :destroy, :followings, :followers]
  def create
    current_customer.follower(@customer)
    unless params[:follow]
      @customer_count = current_customer
    else
      @customer_count = @customer
    end
  end

  def destroy
    current_customer.unfollower(@customer)
    unless params[:follow]
      @customer_count = current_customer
    else
      @customer_count = @customer
    end
  end

  def followings
    @customers = @customer.followings.page(params[:page]).per(6)
  end

  def followers
    @customers = @customer.followers.page(params[:page]).per(6)
  end

  private

  def find_customer
    @customer = Customer.find(params[:customer_id])
  end
end
