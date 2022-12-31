class Public::GroupsController < ApplicationController
  def show
    @character = Character.find(params[:character_id])
    @group = Group.find(params[:id])
    @customers = @group.customers.page(params[:page])
  end

  def join
    @character = Character.find(params[:character_id])
    @group = Group.find(params[:group_id])
    @group.customers << current_customer
    # redirect_to character_path(@character)
  end
  def destroy
    @character = Character.find(params[:character_id])
    @group =Group.find(params[:id])
    @group.customers.delete(current_customer)
    # redirect_to character_path(@character)
  end
end
