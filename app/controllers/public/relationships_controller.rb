class Public::RelationshipsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.relationships.create(followed_id: @customer.id)
    redirect_to request.referer
  end
  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.relationships.find_by(followed_id: @customer.id).destroy
    redirect_to request.referer
  end
  def followings
    customer = Customer.find(params[:customer_id])
    @customers = customer.followings
  end
  def followers
    customer = Customer.find(params[:customer_id])
    @customers = customer.followers
  end
end